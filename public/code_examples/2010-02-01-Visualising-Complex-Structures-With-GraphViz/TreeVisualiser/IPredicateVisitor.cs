using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TreeVisualiser
{
    public interface IPredicateVisitor
    {
        void Visit(RootPredicate predicate);
        void Visit(AndPredicate predicate);
        void Visit(OrPredicate predicate);
        void Visit(ComparePredicate predicate);
    }
}
