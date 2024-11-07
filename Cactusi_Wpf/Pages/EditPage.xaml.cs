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
    /// Логика взаимодействия для EditPage.xaml
    /// </summary>
    public partial class EditPage : Page
    {
        private Cactus _cactus;
        public EditPage(Cactus cactus)
        {
            //_cactus = ConnectionClass.DB.Cactus.Where(z => z.ID_Cactus == _cactus.ID_Cactus).FirstOrDefault();
            InitializeComponent();
            _cactus = cactus;
            this.DataContext = _cactus;
            //TxtCactusName.Text = _cactus.Cactus_Name; 
            //TxtPrice.Text = Convert.ToString(_cactus.Price);
            //TxtAge.Text = Convert.ToString(_cactus.Age);
            //TxtInstruction.Text = _cactus.Instructions;
            //TxtRewards.Text = _cactus.Rewards;

        }

        private void Btn_AddReward_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(txtPlus.Text))
            {
                return;
            }
            else if (string.IsNullOrEmpty(TxtRewards.Text))
            {
                TxtRewards.Text = txtPlus.Text;
                txtPlus.Text = "";
            }
            else
            {
                TxtRewards.Text += ", " + txtPlus.Text;
                txtPlus.Text = "";
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var a = ConnectionClass.DB.Cactus.Where(z => z.ID_Cactus == _cactus.ID_Cactus).FirstOrDefault();
                if (string.IsNullOrEmpty(TxtCactusName.Text) || string.IsNullOrEmpty(TxtPrice.Text) || string.IsNullOrEmpty(TxtInstruction.Text) ||
       string.IsNullOrEmpty(TxtAge.Text) || string.IsNullOrEmpty(TxtRewards.Text))
                {
                    MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                a.Cactus_Name = TxtCactusName.Text;
                a.Price = Convert.ToInt32(TxtPrice.Text);
                a.Age = Convert.ToInt32(TxtAge.Text);
                a.Rewards = TxtRewards.Text;
                ConnectionClass.DB.SaveChanges();
                MessageBox.Show("Изменения сохранены", "Изменение данных о сотруднике", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"{ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void TxtCactusName_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void TxtVid_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void TxtPrice_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void TxtBookDescription_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void txtProishozhdenie_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void TxtAge_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void txtPlus_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
        
        private void TxtAge_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }
        private void TxtPrice_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
