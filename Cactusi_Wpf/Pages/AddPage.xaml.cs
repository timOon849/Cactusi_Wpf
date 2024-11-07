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
using System.Xml.Linq;

namespace Cactusi_Wpf.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddPage.xaml
    /// </summary>
    public partial class AddPage : Page
    {
        private Cactus cactus;
        public AddPage()
        {
            cactus = new Cactus();
            InitializeComponent();
            CmbVid.ItemsSource = ConnectionClass.DB.Vid.ToList();
            CmbProishozhdenie.ItemsSource = ConnectionClass.DB.Proishozhdenie.ToList();
        }

        private void CmbProishozhdenie_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void CmbVid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void TxtCactusName_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void TxtPrice_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void TxtBookDescription_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void TxtAge_TextChanged(object sender, TextChangedEventArgs e)
        {

        }


        private bool IsTextAllowed(string text)
        {
            foreach (char c in text)
            {
                if (!char.IsDigit(c))
                    return false;
            }
            return true;
        }
        private void TxtPrice_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!IsTextAllowed(e.Text))
            {
                e.Handled = true;
            }
        }
        private void TxtAge_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!IsTextAllowed(e.Text))
            {
                e.Handled = true;
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(TxtCactusName.Text) || CmbProishozhdenie.SelectedItem == null || string.IsNullOrEmpty(TxtPrice.Text) || string.IsNullOrEmpty(TxtInstruction.Text) || CmbVid.SelectedItem == null ||
                   string.IsNullOrEmpty(TxtAge.Text) || string.IsNullOrEmpty(TxtRewards.Text))
                {
                    MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                else
                {
                    cactus.Cactus_Name = TxtCactusName.Text;
                    cactus.Proishozhdenie = (Proishozhdenie)CmbProishozhdenie.SelectedItem;
                    cactus.Price = Convert.ToInt32(TxtPrice.Text);
                    cactus.Vid = (Vid)CmbVid.SelectedItem;
                    cactus.Instructions = TxtInstruction.Text;
                    cactus.Age = Convert.ToInt32(TxtAge.Text);
                    cactus.Rewards = TxtRewards.Text;

                    ConnectionClass.DB.Cactus.Add(cactus);
                    ConnectionClass.DB.SaveChanges();
                    NavigationService.Navigate(new CactusPage());
                    MessageBox.Show("Новый кактус добавлен", "Добавление кактуса", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"{ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
