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
    /// Логика взаимодействия для MenuPage.xaml
    /// </summary>
    public partial class MenuPage : Page
    {
        public MenuPage()
        {
            InitializeComponent();
        }

        private void StudentBTN_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Студенты", new StudentPage()));
        }

        private void ExamBTN_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Экзамены", new ExamenPage()));
        }

        private void EmployeeBTN_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Сотрудники", new EmployeePage()));
        }

        private void DisciplineBTN_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent("Дисциплина", new DisciplinePage()));
        }
    }
}
