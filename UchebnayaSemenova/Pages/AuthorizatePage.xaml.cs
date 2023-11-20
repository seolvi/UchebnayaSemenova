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
using UchebnayaSemenova;
using UchebnayaSemenova.Bases;


namespace UchebnayaSemenova.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizatePage.xaml
    /// </summary>
    public partial class AuthorizatePage : Page
    {
        public AuthorizatePage()
        {
            InitializeComponent();
        }

        private void EnterBtn_Click(object sender, RoutedEventArgs e)
        {
            var emp = App.db.Employee.Where(x => x.Id_Employee.ToString() == PasswordPb.Password).FirstOrDefault();
            var stu = App.db.Student.Where(x => x.Id_Student.ToString() == PasswordPb.Password).FirstOrDefault();
            if (emp != null)
            {
                App.isPrepodovatel = true;
                MessageBox.Show("Добро пожаловать, преподаватель!");
                Navigation.NextPage(new PageComponent("Препод", new ExamenPage()));
            }
            else if (stu != null)
            {
                App.isStudent = true;
                MessageBox.Show("Добро пожаловать, студент!");
                Navigation.NextPage(new PageComponent("Студент", new StudentPage()));
            }
            else if (PasswordPb.Password == "1718")
            {
                App.isAdmin = true;
                MessageBox.Show("Добро пожаловать, админ!");
                Navigation.NextPage(new PageComponent("Админская", new MenuPage()));
            }
            else
                MessageBox.Show("Нет пользователся с таким номером");
        }
    }
}
