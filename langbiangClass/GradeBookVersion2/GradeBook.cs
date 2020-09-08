using System;



namespace GradeBookVersion2
{
    class GradeBook
    {
        private int[] grades;

        public string CourseName { get; }

        public GradeBook(string name, int[] gradeArray)
        {
            grades = gradeArray;
            CourseName = name;
        }

        public void DisplayMassege()
        {
            Console.WriteLine($"Welcom to the grade book for \n {CourseName} "
                );
        }

        public void ProcessGrades()
        {
            OutputGrade();

            Console.WriteLine($"Diem trung trung cua hoc sinh la : {GetAverage():F}");

            Console.WriteLine($"Diem thap nhap: {GetMinimum()}");

            Console.WriteLine($"Diem cao nhat: {GetMaximum()}");

            Console.WriteLine();

            Distribute();
        }

        public  void OutputGrade()
        {
            Console.WriteLine("Diem cua hoc sinh la:");
            for (int Hocsinh = 0; Hocsinh < grades.Length; Hocsinh++)
            {
                Console.WriteLine($"Student {Hocsinh +1,2}: {grades[Hocsinh]} ");
            }
        }

        public double GetAverage()
        {
            var total = 0.0;
            foreach (var grade in grades)
            {
                total += grade;
            }
            return total / grades.Length;
        }

        public int GetMinimum()
        {
            var GradeLowest = grades[0];
            foreach (var diem in grades)
            {
                if (diem < GradeLowest)
                {
                    GradeLowest = diem;
                }
            }
            return GradeLowest;
        }

        public int GetMaximum()
        {
            var GradeHigher = grades[0];
            foreach (var diem in grades)
            {
                if (diem > GradeHigher)
                {
                    GradeHigher = diem;
                }
            }
            return GradeHigher;
        }

       public void Distribute()
        {
            Console.WriteLine($"{"Grade"} {"Distribute",5}");

            var frequency = new int[11];

            foreach (var grade in grades)
            {
                ++frequency[grade/10];
            }

            for (int i = 0; i < frequency.Length; i++)
            {
                if (i == 10)
                {
                    Console.Write("  100:");
                }
                else
                {
                    Console.Write($"{i * 10:D2}-{i*10 +9:D2}:");
                }
                for (int sao = 0; sao < frequency[i]; sao++)
                {
                    Console.Write("-");
                }

                Console.WriteLine();
            }
        }
    }
}
