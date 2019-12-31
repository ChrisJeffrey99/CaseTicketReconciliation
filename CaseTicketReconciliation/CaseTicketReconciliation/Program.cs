using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaseTicketReconciliation
{
    class Program
    {
        static void Main(string[] args)
        {
            const char delimeter = ',';
            List<string[]> cells = new List<string[]>();

            StreamReader sr = new StreamReader(File.OpenRead("C:/Users/CJeffrey/OneDrive - Encore Business Solutions Inc/Documents/Care/Case Reconciliation/Reconcile/Freshdesk_Care-OpenTickets.csv"));

            int i = 0;
            while (!sr.EndOfStream)
            {
                cells.Add(sr.ReadLine().Split(delimeter));

                Console.Write("Row: " + i + " | ");
                for (int x = 0; x < cells[i].Length; x++)
                {
                    Console.Write(x + " || " + "Cell Contents: " + cells[i][x].ToString());
                }
                i++;
            }
        }
    }
}
