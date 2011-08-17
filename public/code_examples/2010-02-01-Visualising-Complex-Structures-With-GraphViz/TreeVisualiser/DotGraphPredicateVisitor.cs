using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.CodeDom.Compiler;

namespace TreeVisualiser
{
    public class DotGraphPredicateVisitor : IPredicateVisitor
    {
        private readonly IndentedTextWriter writer;
        private readonly PredicateIdConverter ids = new PredicateIdConverter();

        public DotGraphPredicateVisitor(IndentedTextWriter writer)
        {
            if (writer == null) throw new ArgumentNullException("writer");
            this.writer = writer;
        }

        public void Visit(RootPredicate predicate)
        {
            writer.WriteLine("digraph G {");
            writer.Indent++;

            var thisId = ids.GetIdFor(predicate);
            var childId = ids.GetIdFor(predicate.RootChild);

            writer.WriteLine("{0} [label=\"Root\"];", thisId);
            writer.WriteLine("{0} -> {1};", thisId, childId);
            
            predicate.RootChild.Accept(this);

            writer.Indent--;
            writer.WriteLine("}");
        }

        public void Visit(AndPredicate predicate)
        {
            var thisId = ids.GetIdFor(predicate);
            var leftId = ids.GetIdFor(predicate.LeftChild);
            var rightId = ids.GetIdFor(predicate.RightChild);
            var extraStyling = predicate.IsDeleted ? ",color=gray" : string.Empty;

            writer.WriteLine("{0} [label=\"And\"{1}];", thisId, extraStyling);
            writer.WriteLine("{0} -> {1};", thisId, leftId);
            writer.WriteLine("{0} -> {1};", thisId, rightId);

            predicate.LeftChild.Accept(this);
            predicate.RightChild.Accept(this);
        }

        public void Visit(OrPredicate predicate)
        {
            var thisId = ids.GetIdFor(predicate);
            var leftId = ids.GetIdFor(predicate.LeftChild);
            var rightId = ids.GetIdFor(predicate.RightChild);
            var extraStyling = predicate.IsDeleted ? ",color=gray" : string.Empty;

            writer.WriteLine("{0} [label=\"Or\"{1}];", thisId, extraStyling);
            writer.WriteLine("{0} -> {1};", thisId, leftId);
            writer.WriteLine("{0} -> {1};", thisId, rightId);

            predicate.LeftChild.Accept(this);
            predicate.RightChild.Accept(this);
        }

        public void Visit(ComparePredicate predicate)
        {
            var comparisonTemplates = new Dictionary<string, string>
            {
                {"StringEquals", "{0} equals '{1}'"},
                {"BoolEquals", "{0} is {1}"},
                {"IntGreater", "{0} is greater than {1}"},
                {"AgeGreaterThan", "{0} is more than {1} years ago"},
                {"AgeLessThan", "{0} is less than {1} years ago"},
            };

            var template = comparisonTemplates[predicate.CompareType];
            var description = string.Format(template, predicate.FieldSpec.Name, predicate.MatchValue);
            writer.WriteLine("{0} [label=\"{1}\"];", ids.GetIdFor(predicate), description);
        }
    }    
}
