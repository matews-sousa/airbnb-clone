class HostsController < ApplicationController
  before_action :authenticate_user!, only: [:become_host, :connected]

  def become_host
    if !current_user.stripe_account_id.present?
      account = Stripe::Account.create({
        type: 'express',
        country: 'BR',
        email: current_user.email,
        capabilities: {
          card_payments: {requested: true},
          transfers: {requested: true},
        },
        business_profile: {
          mcc: '6513',
          product_description: 'Aluguel de imóveis',
        },
        business_type: 'individual',
        individual: {
          first_name: current_user.name,
          email: current_user.email,
        }
      })
      current_user.update(
        stripe_account_id: account.id
      )
    end

    link = Stripe::AccountLink.create({
      account: current_user.stripe_account_id,
      refresh_url: my_places_url,
      return_url: connected_url + '?success=true',
      type: 'account_onboarding',
    })
    redirect_to link.url, allow_other_host: true
  end

  def connected
    if params[:success].present?
      current_user.update(is_host: true, charges_enabled: true)
      redirect_to my_places_path
    else
      redirect_to my_places_path
    end
  end
end
