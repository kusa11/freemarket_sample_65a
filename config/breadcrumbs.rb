crumb :root do
  link "FURIMA", root_path
end

crumb :user_show do
  link "マイページ", "/users/mypage"
end

crumb :user_profile do
  link "プロフィール", '#'
  parent :user_show
end

crumb :user_credit_edit do
  link "支払い方法", new_card_path
  parent :user_show
end

crumb :user_confirmation do
  link "本人情報の登録", '#'
  parent :user_show
end

crumb :user_myaddress do
  link "発送元・お届け先住所変更", '#'
  parent :user_show
end

crumb :user_mail_password do
  link "メール/パスワード", '#'
  parent :user_show
end

crumb :user_tel do
  link "電話番号の確認", '#'
  parent :user_show
end

crumb :user_logout do
  link "ログアウト", logout_user_path
  parent :user_show
end

crumb :user_myproducts_exhibiting do
  link "出品した商品−出品中", '#'
  parent :user_show
end

crumb :user_myproducts_trading do
  link "出品した商品−取引中", '#'
  parent :user_show
end

crumb :user_myproducts_sold do
  link "出品した商品−売却済み", '#'
  parent :user_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).