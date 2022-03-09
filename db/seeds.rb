User.create!(nickname: "管理者",
             email: "liverpool10@gmail.com",
             password: ENV["ADMIN_USER_PASSWORD"],
             password_confirmation: ENV["ADMIN_USER_PASSWORD"],
             last_name: "原",
             first_name: "太郎",
             admin: true)
             