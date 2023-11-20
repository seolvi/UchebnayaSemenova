using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
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
            if (App.isAdmin)
            {
                return;
            }
            AddBtn.Visibility = Visibility.Hidden;
        }


        private void Refresh()
        {
            IEnumerable<Examen> SortedStudent = App.db.Examen;
            if (SortList.SelectedIndex == 0)
            {
                SortedStudent = SortedStudent.OrderBy(x => x.Mark);
            }
            else if (SortList.SelectedIndex == 1)
            {
                SortedStudent = SortedStudent.OrderByDescending(x => x.Mark);
            }

            if (FiltrList.SelectedIndex == 0)
                SortedStudent = SortedStudent.Where(x => x.Mark == 5);
            if (FiltrList.SelectedIndex == 1)
                SortedStudent = SortedStudent.Where(x => x.Mark == 4);
            if (FiltrList.SelectedIndex == 2)
                SortedStudent = SortedStudent.Where(x => x.Mark == 3);
            if (FiltrList.SelectedIndex == 3)
                SortedStudent = SortedStudent.Where(x => x.Mark == 2);

            if (SearchTb.Text != null)
            {
                SortedStudent = SortedStudent.Where(x => x.Student.Surname_Student.ToLower().Contains(SearchTb.Text.ToLower()));
            }

            StudentP.ItemsSource = SortedStudent.ToList();
        }

        private void SortList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void FiltrList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            //new StudentWindow().ShowDialog();
        }
    }
}

