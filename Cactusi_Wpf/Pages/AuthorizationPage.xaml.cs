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
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public AuthorizationPage()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string login = txtLogin.Text;
            string password = PassBox.Password;

            var loginObj = ConnectionClass.DB.Users.FirstOrDefault(log => log.Login == login && log.Password == password);

            if (loginObj == null)
            {
                MessageBox.Show("Пользователь не найден");
            }
            else if(loginObj != null) 
            {
                MessageBox.Show("Пользователь найден");
                NavigationService.Navigate(new CactusPage());
            }
            txtLogin.Text = "";
            PassBox.Password = "";
        }

        private void RegButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegPage());
        }
    }
}
