using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.CodeDom.Compiler;

namespace TreeVisualiser
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Error.WriteLine("Getting tree for predicate root id '{0}'", args[0]);
            Console.Error.WriteLine("Using connection string '{0}'", args[1]);
            
            var rootId = new Guid(args[0]);

            using (var context = new DataDataContext(args[1]))
            {
                var root = context.Predicates.Single(x => x.Id == rootId);

                var writer = new IndentedTextWriter(Console.Out);

                var visitor = new DotGraphPredicateVisitor(writer);
                root.Accept(visitor);
            }
        }
    }
}
