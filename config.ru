require 'rack/rewrite'
require 'rack'


use Rack::Rewrite do
  newhome = 'http://www.jmerrifield.com/software/'
  r301 '/', newhome

  r301 '/2011/08/17/Mocking-Backticks-with-RR-and-AAA', "#{newhome}articles/mocking-backticks-with-rr-and-aaa/"
  r301 '/2010/03/09/Rendering-Text-with-ASP.NET', "#{newhome}articles/rendering-text-with-asp-net/"
  r301 '/2010/02/17/Readable-String-Concatenation', "#{newhome}articles/readable-string-concatenation/"
  r301 '/2010/02/01/Visualising-Complex-Structures-With-GraphViz', "#{newhome}articles/visualising-complex-structures-with-graphviz/"
  r301 '/2010/01/29/LINQ-to-SQL-Unspecified-Error-and-missing-designer-file', "#{newhome}articles/linq-to-sql-unspecified-error-and-missing-designer-file/"
  r301 '/2010/01/27/Form-Control-Naming-Conventions', "#{newhome}articles/form-control-naming-conventions/"
  r301 '/2010/01/26/Jon-starts-a-tech-blog', "#{newhome}articles/jon-starts-a-tech-blog/"

  r301 '/blog/post.aspx?id=4858c45d-cf3d-4d96-8bea-7c4ede768e2b', "#{newhome}articles/jon-starts-a-tech-blog/"
  r301 '/blog/post.aspx?id=c9c54a9f-927b-4908-be18-5391e6945304', "#{newhome}articles/form-control-naming-conventions/"
  r301 '/blog/post.aspx?id=d4b48f48-1bb9-4519-988f-c8ebf56638dd', "#{newhome}articles/linq-to-sql-unspecified-error-and-missing-designer-file/"
  r301 '/blog/post.aspx?id=d23719a1-8bfc-48e1-9896-c7c185ae3479', "#{newhome}articles/visualising-complex-structures-with-graphviz/"
  r301 '/blog/post.aspx?id=59da6dcd-9072-4e83-93f9-098f0e3aed48', "#{newhome}articles/readable-string-concatenation/"
  r301 '/blog/post.aspx?id=3a008a6f-82ac-44c1-9bb3-771f1abbf2fc', "#{newhome}articles/rendering-text-with-asp-net/"

  r301 '/yagri/blog/post.aspx?id=4858c45d-cf3d-4d96-8bea-7c4ede768e2b', "#{newhome}articles/jon-starts-a-tech-blog/"
  r301 '/yagri/blog/post.aspx?id=c9c54a9f-927b-4908-be18-5391e6945304', "#{newhome}articles/form-control-naming-conventions/"
  r301 '/yagri/blog/post.aspx?id=d4b48f48-1bb9-4519-988f-c8ebf56638dd', "#{newhome}articles/linq-to-sql-unspecified-error-and-missing-designer-file/"
  r301 '/yagri/blog/post.aspx?id=d23719a1-8bfc-48e1-9896-c7c185ae3479', "#{newhome}articles/visualising-complex-structures-with-graphviz/"
  r301 '/yagri/blog/post.aspx?id=59da6dcd-9072-4e83-93f9-098f0e3aed48', "#{newhome}articles/readable-string-concatenation/"
  r301 '/yagri/blog/post.aspx?id=3a008a6f-82ac-44c1-9bb3-771f1abbf2fc', "#{newhome}articles/rendering-text-with-asp-net/"

  r301 /\/yagri\//, newhome

  r301 '/atom', "#{newhome}feed.xml"
end

class FallThru
  def call(env)
    newhome = 'http://www.jmerrifield.com/software/'
    [301, {'location' => newhome}, [%Q(Redirecting to <a href="#{newhome}">#{newhome}</a>)]]
  end
end

run FallThru.new