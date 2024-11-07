using Cactusi_Wpf.Db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Cactusi_Wpf.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegPage.xaml
    /// </summary>
    public partial class RegPage : Page
    {
        private Users users;
        public RegPage()
        {
            InitializeComponent();
            users = new Users();
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            string login = txtLogin.Text;
            string password = PassBox.Password;
            string password1 = Pass1Box.Password;

            if (string.IsNullOrEmpty(login) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(password1))
            {
                MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else if (ConnectionClass.DB.Users.Any(u => u.Login == login))
            {
                MessageBox.Show("Пользователь с таким логином уже существует");
                return;
            }
            else if (password != password1)
            {
                MessageBox.Show("Пароли не совпадают");
                return;
            }
            else
            {
                var user = new Users
                {
                    Login = login,
                    Password = password1,
                    ID_Role = 1
                };
                var a = ConnectionClass.DB.Users.Where(log => log.Login == txtLogin.Text && log.Password == PassBox.Password).FirstOrDefault();
                ConnectionClass.DB.Users.Add(user);
                MessageBox.Show("Регистрация пройдена");
                ConnectionClass.DB.SaveChanges();
                NavigationService.Navigate(new AuthorizationPage());
            }
        }
    }
}
