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
    /// Логика взаимодействия для AddVistavkaPage.xaml
    /// </summary>
    public partial class AddVistavkaPage : Page
    {
        public AddVistavkaPage()
        {
            InitializeComponent();
            CmbNameCactus.ItemsSource = ConnectionClass.DB.Cactus.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {

            NavigationService.GoBack();
        }

        private void CmbNameCactus_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
