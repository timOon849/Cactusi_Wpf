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
    /// Логика взаимодействия для CactusPage.xaml
    /// </summary>
    public partial class CactusPage : Page
    {
        private Cactus cactus;
        public CactusPage()
        {
            InitializeComponent();
            ListCactuses.ItemsSource = ConnectionClass.DB.Cactus.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddPage());
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedCactus = ListCactuses.SelectedItem as Cactus;
            if (selectedCactus != null)
            {
                NavigationService.Navigate(new EditPage(selectedCactus));
            }
            else
            {
                MessageBox.Show("Для начала выберите запись!!!");
            }
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Удалить данную запись?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.No)
            {
                return;
            }
            else
            {
                var a = ListCactuses.SelectedItem as Cactus;
                if (a != null)
                {
                    ConnectionClass.DB.Cactus.Remove(a);
                    ConnectionClass.DB.SaveChanges();
                    ListCactuses.ItemsSource = ConnectionClass.DB.Cactus.ToList();
                }
                else
                {
                    MessageBox.Show("Для начала выберите запись!!!");
                }
            }
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            App.Current.MainWindow.Close();
        }

        private void BtnVistavki_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new VistavkiPage());
        }

        private void BtnAUthExit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AuthorizationPage());
        }
    }
}
