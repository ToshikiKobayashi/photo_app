class CreateOauthCertifiers < ActiveRecord::Migration[6.0]
  def change
    create_table :oauth_certifiers do |t|
      t.text :userid
      t.text :client_id
      t.text :client_secret
      t.text :redirect_uri

      t.timestamps
    end
  end
end
