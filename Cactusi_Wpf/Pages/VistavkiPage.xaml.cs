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
    /// Логика взаимодействия для VistavkiPage.xaml
    /// </summary>
    public partial class VistavkiPage : Page
    {
        public VistavkiPage()
        {
            InitializeComponent();
            ListVistavki.ItemsSource = ConnectionClass.DB.Vistavka.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {

            NavigationService.Navigate(new AddVistavkaPage());
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EditVistavkiPage());
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
