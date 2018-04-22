opm = Opm.create(name: "1 BPM", address: "Praça Pedro Americo, s/n, Centro", zip_code: "58080100")

roles_names = %w(permissions_new permissions_create permissions_destroy permissions_edit permissions_index permissions_update opms_create opms_destroy opms_edit opms_index opms_new opms_show opms_update users_create users_destroy users_edit users_index users_new users_show users_update)
roles_names.each { |n| Role.create(name: n) }

permission = Permission.create(name: 'administrador', description: 'administrador')
permission.roles << Role.all

address = Address.create(street: 'rua', number: 'comp', district: 'Esplanada', city: 'joao pessoa', state: 'paraiba')

person = Person.create(full_name:'admin', birth_date: DateTime.new(1989, 03, 12), cpf: '99999999999', home_phone: '8392341234',
mobile_phone: '83986202016', address: address)


user = User.create(email: 'admin@pm.pb.gov.br',
                password: '12345678', password_confirmation: '12345678',
                military: false, inactive: false, person: person, opm: opm)

user.permissions << permission
user.roles << Role.all
