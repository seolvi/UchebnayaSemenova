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
using UchebnayaSemenova.Bases;


namespace UchebnayaSemenova.Pages
{
    /// <summary>
    /// Логика взаимодействия для StudentPage.xaml
    /// </summary>
        public partial class StudentPage : Page
        {
            public StudentPage()
            {
                InitializeComponent();
            StudentP.ItemsSource = App.db.Examen.ToList();
        }

        public static List<Examen> ItemsSource { get; }

        private void SortList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
    }

