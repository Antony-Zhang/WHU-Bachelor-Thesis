%% This program is a LaTeX class file for bachelor thesis template
%% of Wuhan University 2025
%%
%% Copyright \copyright\ 2019 Fing @ WHU
%% Fing: v0.1, 2019/03/18
%%
%% Modified by AaronComo @ WHU
%% AaronComo: v1.0, 2025/01/15
%%
%% This project uses the MIT License, see LICENSE for more details.
%% ----------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{whu-bachelor-style}[Wuhan University Thesis Template for Bachelor Degree]

%%% ---- 载入Class ----- %%%
\LoadClass[a4paper,openany,oneside]{book} % A4大小，book布局

\RequirePackage[AutoFakeBold=true,AutoFakeSlant=true]{xeCJK}[2017/08/08]
\RequirePackage[zihao=-4,UTF8,heading=true]{ctex}[2016/12/27]
\RequirePackage{xeCJKfntef}

%%% ---- 定义页边距 ----- %%%
\RequirePackage{geometry}
\geometry{left=3.18cm,right=3.18cm,top=2.54cm,bottom=2.54cm,includefoot,xetex}
% \RequirePackage{xcolor} % 颜色
% \definecolor{headercolor}{RGB}{0, 0, 255} % 定义蓝色

\RequirePackage{fancyhdr}             % 页眉页脚宏包
\renewcommand{\headrulewidth}{0.4pt}  % 页眉线宽
\renewcommand{\footrulewidth}{0pt}    % 页脚线宽

%%% --- 定义方框（用于存放提示词） ----- %%%
\RequirePackage{tikz}
\RequirePackage[most]{tcolorbox}            % 方框盒子
% \newtcolorbox{promptbox}[1][]{
%     % colback=promptbg,          % 背景颜色
%     colframe=black,     % 边框颜色
%     % coltitle=black,            % 标题颜色
%     % fonttitle=\bfseries,       % 标题字体加粗
%     % boxrule=0.5mm,             % 边框粗细
%     % arc=3mm,                   % 圆角弧度
%     % outer arc=3mm,             % 外部圆角弧度
%     % left=2mm, right=2mm, top=2mm, bottom=2mm, % 内边距
%     #1                         % 其他可选参数
% }
% \makeatletter
% \renewcommand{\chapterheadstartvskip}{\vspace*{0.5ex}} % 调整这里的值
% \makeatother

% % 默认页面页眉页脚样式 (空白)
\pagestyle{empty} % 启动页眉页脚样式
% 带页眉的样式
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[C]{武汉大学本科毕业论文（设计）}
    \fancyfoot[C]{\zihao{5}\thepage}  % 页码位于页脚居中
}
% \pagestyle{plain} % 启动页眉页脚样式


%%% ---- 定义标题和段落样式 ----- %%%
% 定义1.5倍行间距
\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.5}
% 设置各个标题样式
\ctexset{chapter={
  format={\centering \heiti \zihao{-2}}, 
  number={   % 各章标题 黑体小2号 // 修改：标题和数字字号一致 
    \arabic{chapter}},
  name={,},
  afterskip={0.5ex},
  beforeskip={0.5ex}} % 标题之前的垂直间距
}
\ctexset{section={format={\raggedright \heiti \zihao{4}}}}          % 一级标题 黑体 4号
\ctexset{subsection={format={\raggedright \heiti \zihao{-4}}}}      % 二级标题 黑体小4号
\ctexset{subsubsection={format={\raggedright \heiti \zihao{-4}}}}   % 三级标题 黑体小4号

% % 定义一个新的标题格式专用于附录
% \RequirePackage{titlesec}
% \newcommand{\appendixtitleformat}{
%   \titleformat{\chapter}[hang]
%     {\normalfont\Huge\bfseries}
%     {附录~\thechapter}{1em}{}
% }

% 调整Chapter标题的上下文间距
\makeatletter
\renewcommand{\@makechapterhead}[1]{
  % \vspace*{0ex} % 调整这里的值来控制标题上方的空白
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \vspace*{-2ex} % 调整这里的值来控制目录标题上方的空白
        % 将序号和标题放在同一行
        \centering
        \heiti \zihao{-2} 
        \thechapter \hspace{1ex} % 序号和标题之间的间距
        #1
        \par\nobreak
        \vskip 0.5ex  % 标题下方的间距
      \else
        \centering
        \heiti \zihao{-2} #1\par\nobreak
        \vskip 0.5ex
      \fi
    \else
      \centering
      \heiti \zihao{-2} #1\par\nobreak
      \vskip 0.5ex
    \fi
  }}
\makeatother

% 无编号章节的标题样式（如 \chapter*{致谢}）
\makeatletter
\renewcommand{\@makeschapterhead}[1]{
  % \vspace*{0ex} % 调整这里的值来控制标题上方的空白
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \centering
      \heiti \zihao{-2} #1\par\nobreak
      \vskip 0.5ex
    \else
      \centering
      \heiti \zihao{-2} #1\par\nobreak
      \vskip 0.5ex
    \fi
  }}
\makeatother
% \renewcommand{\@makeschapterhead}[1]{
%   \vspace*{-2ex}
%   {\parindent \z@ \centering
%     \heiti \zihao{-2} #1\par\nobreak
%     \vskip 0.5ex
%   }}
% \makeatother

% \songti 宋体 \heiti 黑体  \kaishu 楷体 \fangsong 仿宋

% 目录样式设置
% 最多展示章节条三级标题；章节序号为Times New Roman小四号，章的标题为宋体加粗小四号，其他内容为宋体小四号；每项后需标明页码
\RequirePackage{tocloft}
\setcounter{tocdepth}{3}        % 目录层级数
\setcounter{secnumdepth}{3}     % 标题层级数

\renewcommand{\cfttoctitlefont}{\hfill\heiti\zihao{-2}} % 目录标题 黑体小 2 号
\renewcommand{\contentsname}{目\hspace{2em}录}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength\cftbeforetoctitleskip{0cm}
\setlength\cftaftertoctitleskip{0ex}

\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1}  % 点间距
\renewcommand{\cftchapdotsep}{\cftdotsep}

\renewcommand\cftchapfont{\bf\songti\zihao{-4}} % 目录章标题 宋体加粗小四号
\renewcommand\cftsecfont{\songti\zihao{-4}}
\renewcommand\cftsubsecfont{\songti\zihao{-4}}
% \renewcommand\cftsubsubsecfont{\songti\zihao{-4}}
\renewcommand\cftchappagefont{\heiti\zihao{-4}} % 目录页码字体 宋体小四
\renewcommand\cftsecpagefont{\songti\zihao{-4}}
\renewcommand\cftsubsecpagefont{\songti\zihao{-4}}
% \renewcommand\cftsubsubsecpagefont{\songti\zihao{-4}}

\renewcommand\cftchapafterpnum{\vskip0pt}  % 目录章标题后间距
\renewcommand\cftsecafterpnum{\vskip0pt}
% \renewcommand\cftsubsecafterpnum{\vskip2pt}
\setlength{\cftsecindent}{1em}           % 目录二级标题缩进
\setlength{\cftsubsecindent}{2em}
% \setlength{\cftsubsubsecindent}{1.85em}

%%% ---- 图表标题设置 ----- %%%
\RequirePackage[labelsep=quad]{caption}     % 序号之后空一格写标题
% 设置表格标题、图标题字体为宋体
\captionsetup[figure]{textfont=bf}
\renewcommand\figurename{\bf\songti\zihao{5} 图}
\captionsetup[table]{textfont=bf}
\renewcommand\tablename{\bf\songti\zihao{5} 表}


% 预定义（在导言区加入一次即可）
% \newcounter{fakefigure}[section]  % 和章节编号同步
% % \renewcommand{\thefakefigure}{\thefigure}  % 共享编号
\newcommand{\fakecaption}[2]{%
  \refstepcounter{figure} % 关键：增加 figure 计数器 + 设置引用标签
  \begin{center}
    {\songti\zihao{5} \bf{图}~\thefigure\quad \songti\zihao{5}#1}
  \end{center}
  \label{#2}
}


% 使用tabularx创建占满宽度的表格
% \RequirePackage{tabularray}   % 表格
\RequirePackage{tabularx, makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}

\RequirePackage{longtable}  % 做长表格的包
\RequirePackage{booktabs}   % 做三线表的包

% 列表样式
\RequirePackage{enumerate, enumitem}
\setlist{noitemsep}

% 修改脚注
\makeatletter%
\long\def\@makefnmark{%
\hbox {{\normalfont \textsuperscript{\circled{\@thefnmark}}}}}%
\makeatother
% 正文中的编号
\makeatletter%
\long\def\@makefntext#1{%
  \parindent 1em\noindent \hb@xt@ 1.8em{\hss \circled{\@thefnmark}}#1}%
\makeatother
% 页脚中的编号
\skip\footins=10mm plus 1mm
\footnotesep=6pt
\renewcommand{\footnotesize}{\songti\zihao{5}}
\renewcommand\footnoterule{\vspace*{-3pt}\hrule width 0.3\columnwidth height 1pt \vspace*{2.6pt}}

\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
\node[shape=circle,draw,inner sep=0.5pt] (char) {#1};}} % 圆圈数字①

%%% ---- 引入宏包 ----- %%%
\RequirePackage{amsmath, amssymb}
\RequirePackage[amsmath,thmmarks]{ntheorem}  % 定理
\RequirePackage{graphicx, subcaption}
\RequirePackage{listings}                    % 代码段
% \RequirePackage{minted}                    % 代码高亮（需要 python 安装 pygments 库）
\RequirePackage{algorithm2e, algorithmic}    % 算法代码
\RequirePackage{tikz, pgfplots}              % 绘图
\RequirePackage{fontspec, color, url, array}
\RequirePackage{float}                       % 浮点
\RequirePackage{enumitem}                    % 缩紧列表
\RequirePackage{multirow}                    % 多列表格
\RequirePackage{txfonts}                     % Times 风格（数学）字体

%%% ---- 定义字体 ----- %%%
\renewcommand{\normalsize}{\zihao{-4}}         % 正常字号
% 设置英文字体为 Times New Roman
\setmainfont[Ligatures=Rare]{Times New Roman}
\setsansfont[Ligatures=Rare]{Times New Roman}
\setmonofont[Ligatures=Rare]{Times New Roman}

\renewcommand{\algorithmcfname}{算法}          % 算法两字用中文显示

%%% ---- 数学定理样式 ----- %%%
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
\theorempreskip{0pt}
\theorempostskip{0pt}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}


%%% ---- 参考文献设置 ----- %%%
\RequirePackage[sort&compress]{natbib}
\setcitestyle{numbers,square,comma}
\ctexset{bibname={参考文献}}
% \bibliographystyle{data/whu}  % 参考文献样式
\bibliographystyle{data/gbt7714-2005-whu}  % 参考文献样式


% \RequirePackage[draft]{hyperref} % 引用 (但不生成链接)
\RequirePackage{hyperref} % 引用
% \hypersetup{citecolor=magenta,linkcolor=black,urlcolor=blue} % 设置引用链接颜色
\hypersetup{hidelinks} % 隐藏所有引用颜色


\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} % 自定义新命令\upcite, 使参考文献引用以上标出现

\renewcommand{\eqref}[1]{\textup{{\normalfont（\ref{#1}）\normalfont}}} % 公式引用使用中文括号

% 清除公式上下间距
\AtBeginDocument{
	\setlength{\abovedisplayskip}{6pt}
	\setlength{\belowdisplayskip}{6pt}
	\setlength{\abovedisplayshortskip}{0pt}
	\setlength{\belowdisplayshortskip}{0pt} 
}

\graphicspath{{figures/}} % 图片文件路径

% --------------------------------------

%%% ---- 自定义命令 ----- %%%

%%% ---- 封面 ----- %%%
\makeatletter
\def\stunum#1{\def\@stunum{#1}}\def\@stunum{}         % 学号
\def\ctitle#1{\def\@ctitle{#1}}\def\@ctitle{}         % 题目
\def\cschool#1{\def\@cschool{#1}}\def\@cschool{}      % 院系
\def\cmajor#1{\def\@cmajor{#1}}\def\@cmajor{}         % 专业
\def\cauthor#1{\def\@cauthor{#1}}\def\@cauthor{}      % 作者
\def\cadvisor#1{\def\@cadvisor{#1}}\def\@cadvisor{}   % 老师
\def\cdate#1{\def\@cdate{#1}}\def\@cdate{}            % 日期

% 论文标题页
\def\maketitlepage{
  \thispagestyle{empty}
  \begin{center}
    % {\heiti \zihao{5} \hfill 
    % \begin{minipage}[t]{4.5cm}
    %   学号\ ：\uline{\hfill\hspace{3mm}\@stunum\hspace{3mm}\hfill} \\[2mm]
    %   密级\ ：\uline{\hfill \hfill}
    % \end{minipage}}
    % \par \vspace*{6em}

    \begin{figure}[!htb]
      \centering
      \includegraphics[width=0.4\textwidth]
      {figures/whutitle.png}\\
      \label{fig:whutitle}
    \end{figure}
    {\zihao{2}\vspace{\baselineskip}}
    \textbf{\songti \zihao{2}  本科毕业论文（设计）}
    \par \vspace{5em}
    \begin{minipage}[c][6cm]{16cm}
        \setlength{\baselineskip}{32pt} 
        \centering {\kaishu \zihao{1} \@ctitle}
    \end{minipage}
    \par \vspace{4em}
    {\songti \zihao{-3}
      \begin{tabular}{cc}
        \makebox[4cm][s]{姓\ \ \ 名\ ：}                                 & \@cauthor   \\[1ex]
        \makebox[4cm][s]{学\ \ \ 号\ ：}                                 & \@stunum   \\[1ex]
        \makebox[4cm][s]{专\ \ \ 业\ ：}                                 & \@cmajor    \\[1ex]
        \makebox[4cm][s]{学\ \ \ 院\ ：}   & \@cschool   \\[1ex]
        \makebox[4cm][s]{指导教师\ ：}                                 & \@cadvisor  \\[1ex]
      \end{tabular}}
    \par \vspace{5em}
    {\songti \zihao{4} \@cdate}
  \end{center}
  \clearpage
}

% 论文申明页
\def\makestatement{
  \thispagestyle{empty}
  % \vspace*{40pt}
  \begin{center}{\heiti \zihao{-2} 原创性声明}\end{center}
  \par\vspace*{20pt}
  \setlength{\baselineskip}{23pt}
  {\zihao{-4}
  本人郑重声明：所呈交的论文（设计），是本人在指导教师的指导下，严格按照学校和学院有关规定完成的。除文中已经标明引用的内容外，本论文（设计）不包含任何其他个人或集体已发表及撰写的研究成果。对本论文（设计）做出贡献的个人和集体，均已在文中以明确方式标明。本人承诺在论文（设计）工作过程中没有伪造数据等行为。若在本论文（设计）中有侵犯任何方面知识产权的行为，由本人承担相应的法律责任。
  \vspace*{30pt}\newline
  \begin{flushright} % 右对齐
    % 作者签名： \hspace{2cm}   指导教师签名：  \hspace{2cm} \newline
    % 日 \quad 期：  \hspace{1cm}年 \hspace{1cm} 月 \hspace{1cm} 日 
    \begin{tabular}{ll} % 调整列宽以适应你的排版
      &作者签名： \hspace{2cm}   指导教师签名：  \hspace{3cm} \hfill \\[2ex] % 填充空白 % 额外添加 2ex 的垂直空间
      &日 \quad 期：  \hspace{1cm}年 \hspace{0.5cm} 月 \hspace{0.5cm} 日 
    \end{tabular}
  \end{flushright}
  }
  
  % 作者签名: \underline{\hspace{2.5cm}}
  % \hspace{0.6cm}指导教师签名: \underline{\hspace{2.5cm}}
  % \hspace{0.6cm}日期: \underline{\hspace{2.5cm}}\hfill\par}



  \vspace*{140pt}
  \begin{center}{\heiti \zihao{-2} 版权使用授权书}\end{center}
  \par\vspace*{20pt}
  \setlength{\baselineskip}{23pt}
  {\zihao{-4}
  本人完全了解武汉大学有权保留并向有关部门或机构送交本论文（设计）的复印件和电子版，允许本论文（设计）被查阅和借阅。本人授权武汉大学将本论文的全部或部分内容编入有关数据进行检索和传播，可以采用影印、缩印或扫描等复制手段保存和汇编本论文（设计）。
  \vspace*{30pt}\newline
  \begin{flushright} % 整个表格右对齐
    \begin{tabular}{ll} % 调整列宽以适应你的排版
      &作者签名： \hspace{2cm}   指导教师签名：  \hspace{3cm} \hfill \\[2ex] % 填充空白 % 额外添加 2ex 的垂直空间
      &日 \quad 期：  \hspace{1cm}年 \hspace{0.5cm} 月 \hspace{0.5cm} 日 
    \end{tabular}
  \end{flushright}
  % 作者签名: \underline{\hspace{2.5cm}}
  % \hspace{0.6cm}指导教师签名: \underline{\hspace{2.5cm}}
  % \hspace{0.6cm}日期: \underline{\hspace{2.5cm}}\hfill\par
  }
}


\newcommand{\setabstractpage}{
  \pagenumbering{Roman}  % 使用大写罗马数字
  \setcounter{page}{1}   % 页码从 I 开始
}

%%% ---- 摘要 ----- %%%
% 中文摘要
\newenvironment{cnabstract}[1]{
  \setabstractpage
	\def \cnkeyword {#1}
	% \clearpage
  % \thispagestyle{empty}
  \addcontentsline{toc}{chapter}{摘要}  % 添加到目录
  \begin{center} {\heiti \zihao{-2} 摘 \hspace{2em} 要} \end{center}
  % \baselineskip=23pt
  \setlength{\baselineskip}{1.5\baselineskip} % 1.5 倍行距
  \songti \zihao{-4} % 设置正文为宋体小四号
  \quad\quad
}{  % 结束正文
	\vspace*{2em}
	\par\noindent {\songti\zihao{-4} \textbf{关键词：}} {\songti \zihao{-4} \cnkeyword}
	\clearpage
}

% 英文摘要
\newenvironment{enabstract}[1]{
  % \setabstractpage
  \addcontentsline{toc}{chapter}{ABSTRACT}  % 添加到目录
	\def \enkeyword {#1}
  \clearpage
  % \thispagestyle{empty}  
  \begin{center} {\heiti \zihao{-2} \textbf{ABSTRACT}} \end{center}
  % \baselineskip=23pt
  \setlength{\baselineskip}{1.5\baselineskip} % 1.5 倍行距
  % \setmainfont{Times New Roman}  % 设置 Times New Roman 字体
  \zihao{-4} % 设置正文为小四号
  \quad\quad  % 段首空两格
}{
	\vspace*{2em}
	\par\noindent {\bfseries\zihao{-4} Keywords:} {\zihao{-4}\enkeyword}
	\clearpage
}

%%% ---- 目录 ----- %%%
% 生成目录
\newcommand{\contents}{
  \pagestyle{fancy}
  \hypersetup{hidelinks} % 隐藏所有引用颜色
  % \hypersetup{pdfborder={0 0 0}}    % 去掉目录红框
  \cleardoublepage

  % 调整目录标题上方的空白
  \vspace*{-2ex} % 调整这里的值来控制目录标题上方的空白

  % \pagenumbering{gobble}            % 去掉目录页码
  \tableofcontents

  \cleardoublepage
  \pagenumbering{arabic}            % 重新计数页码
  \setcounter{page}{1}

  \renewcommand{\baselinestretch}{1}\normalsize
  \baselineskip=23pt                % 正文行距为 23 磅
  % \hypersetup{pdfborder={0 0 1}}    % 恢复引用红框
}
