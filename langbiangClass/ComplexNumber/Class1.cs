using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComplexNumber
{
    public struct class1
    {
        public double SoThuc  { get; }
        public double SoAo { get;}
        public class1 (double sothuc, double soao)
        {
            SoThuc = sothuc;
            SoAo = soao;
        }
       
        public static class1 operator- (class1 x, class1 y)
        {
            return new class1(x.SoThuc - y.SoThuc , x.SoAo - y.SoAo);
        }

        public static class1 operator+ (class1 x, class1 y)
        {
            return new class1(x.SoThuc + y.SoThuc, y.SoAo + x.SoAo);
        }

        public static class1 operator *(class1 x, class1 y)
        {
            return new class1((x.SoThuc * y.SoThuc) - (x.SoAo * y.SoThuc),
               (x.SoThuc * y.SoAo) + (x.SoAo * y.SoThuc));
        }

        public override string ToString()
       => $"({SoThuc} {(SoAo < 0 ? "-" : "+")} {Math.Abs(SoAo)}i)";
    }
    
}
