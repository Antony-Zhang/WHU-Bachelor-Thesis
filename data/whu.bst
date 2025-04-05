
%% 武汉大学本科毕业论文参考文献样式文件（wuhandxb.bst）
%% 适配GB/T 7714-2015标准
%% 生成数字编码参考文献表

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    url
    doi
    accessed
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block := }

STRINGS { s t }

%% 定义日期格式化函数
FUNCTION {format.date}
{ year empty$
    { month empty$
        { "" }
        { " (" month * ")" * }
      if$
    }
    { month empty$
        { "(" year * ")" * }
        { "(" year * "-" * month * ")" * }
      if$
    }
  if$
}

%% 文献类型标识映射
FUNCTION {type.id}
{ type empty$
    { "Z" }
    { type "article" =
        { "J" }
        { type "book" =
            { "M" }
            { type "proceedings" =  %% 统一会议论文类型为proceedings
                { "A" }
                { type "dataset" =
                    { "DS" }
                    { type "patent" =
                        { "P" }
                        { type "report" =
                            { "R" }
                            { type "software" =
                                { "CP" }
                                { type "standard" =
                                    { "S" }
                                    { type "thesis" =
                                        { "D" }
                                        { "Z" }  %% 默认类型兜底
                                      }
                                  }
                              }
                          }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      if$
    }
  }

%% 作者姓名处理
FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, f.}" format.name$ 't :=  %% 调整格式模板
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { numnames #2 >
                { "," * }
                { " and " * }
              if$
            }
          if$
        }
        { t * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

%% 标题处理
FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

%% 期刊卷期处理
FUNCTION {journal.volume.issue}
{ volume empty$
    { "" }
    { "Vol. " volume * }
  if$
  issue empty$
    { "" }
    { "No. " issue * }
  if$
}

%% 书籍出版信息
FUNCTION {book.publisher}
{ publisher empty$
    { "" }
    { publisher * ", " * }
  if$
}

%% 电子资源链接处理
FUNCTION {format.url}
{ url empty$
    { "" }
    { " \url{" url * "}" }
  if$
}

%% 数字引用标记
FUNCTION {cite}
{ key empty$
    { "" }
    { "[{" number * "}]" }
  if$
}

%% 参考文献表格式
FUNCTION {bibitem}
{ newline$
  "\bibitem[" write$
  number write$
  "]{" write$
  cite$ write$
  "}" newline$
  ""
}

%% 文献类型特定格式
FUNCTION {article}
{ format.authors
  format.title
  " \emph{" swap$ * "}" *
  format.journal
  journal.volume.issue
  format.pages
  format.date
  format.url
}

FUNCTION {book}
{ format.authors
  format.title
  " \textit{" swap$ * "}" *
  format.book.publisher
  format.edition
  format.volume
  format.pages
  format.date
}

FUNCTION {incollection}
{ format.authors
  format.title
  " \emph{" swap$ * "}" *
  format.booktitle
  format.editor
  format.volume
  format.pages
  format.date
}

FUNCTION {inproceedings}
{ format.authors
  format.title
  " \emph{" swap$ * "}" *
  format.booktitle
  format.editor
  format.volume
  format.pages
  format.date
}

FUNCTION {thesis}
{ format.authors
  format.title
  " \textit{" swap$ * "}" *
  format.school
  format.date
}

FUNCTION {report}
{ format.authors
  format.title
  " \textit{" swap$ * "}" *
  organization
  format.date
}

FUNCTION {default.type} { misc }

READ