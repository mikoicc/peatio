def deposit admin_identity, member, amount
    login admin_identity
    click_on 'admin'

    # this part is handled by a google extension
    query = {deposit: { tx_id: "deposit_#{Time.now.to_i}",
              sn: member.sn,
              fund_uid: identity.email,
              fund_extra: member.name,
              channel_id: DepositChannelBank.get.id,
              amount: amount }}

    visit(new_admin_currency_deposit_path(query))

    save_and_open_page

    within 'form' do
      click_on I18n.t('helpers.submit.deposit.create')
    end
end
