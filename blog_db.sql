-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2021 at 08:26 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_tb`
--

CREATE TABLE `contact_tb` (
  `snum` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_tb`
--

INSERT INTO `contact_tb` (`snum`, `date_time`, `name`, `email`, `phone`, `message`) VALUES
(1, '2021-03-12 17:01:20', 'mera naam', 'meranam@gmail.com', '+694949494', 'hey this is my Message'),
(2, '2021-03-12 17:01:20', 'demo_name', 'emailid@gmail.com', '+979595959595', 'loifndinfienirnibrnbinribnrbnrbnrininizchsvhjsvchjv sjcvhsvcjvschjvgcc'),
(3, '2021-03-12 17:02:02', 'kuch naaam', 'kucheamil@gmail.com', '+23262', 'dwjbjwbdw'),
(4, '2021-03-12 17:09:39', 'kuch naaam', 'kucheamil@gmail.com', '+23262', 'dwjbjwbdw'),
(5, '2021-03-12 17:10:43', 'xyz', 'jbvsjv@gmail.com', '+916599595', 'message'),
(6, '2021-03-12 21:26:11', 'farxi', 'sjfn@bvsjdbs.com', '+9494946656', 'hare krishna'),
(7, '2021-03-12 21:27:14', 'farxi', 'sjfn@bvsjdbs.com', '+9494946656', 'hare krishna'),
(8, '2021-03-12 22:38:30', 'farxi', 'sjfn@bvsjdbs.com', '+9494946656', 'hare krishna'),
(9, '2021-03-12 22:38:38', 'farxi', 'sjfn@bvsjdbs.com', '+9494946656', 'hare krishna'),
(10, '2021-03-12 23:57:35', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'messsssss'),
(11, '2021-03-13 00:11:44', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'messsssss'),
(12, '2021-03-13 09:09:15', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'messsssss'),
(13, '2021-03-13 09:11:27', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'messsssss'),
(14, '2021-03-13 09:20:26', 'krishna', 'harekrishna@gmail.com', '+111111111', 'chant hare krishna and be Happy'),
(15, '2021-03-13 09:22:14', 'shubham', 'shubham@gmail.com', '+19464', 'helllo brother'),
(16, '2021-03-14 00:54:51', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'msg'),
(17, '2021-03-14 01:01:12', 'Satyam Toriya', 'toriyasatyam@gmail.com', '990772994a', 'mdg'),
(18, '2021-03-14 01:06:58', 'Satyam Toriya', 'toriyasatyam@gmail.com', '990772994a', 'mdg'),
(19, '2021-03-14 10:08:20', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'msg'),
(20, '2021-03-14 10:09:05', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'msg'),
(21, '2021-03-14 10:09:27', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'msg'),
(22, '2021-03-14 10:12:55', 'Satyam', 'nadanda@gmail.com', '9907729945', 'some msg'),
(23, '2021-03-15 18:47:12', 'harry', 'emailid@gmail.com', '+914949494998', 'mssggg'),
(24, '2021-03-15 18:54:41', 'harry', 'emailid@gmail.com', '+914949494998', 'mssggg'),
(25, '2021-03-15 18:55:26', 'Python', 'p@gmail.com', '9899595959', 'some mesg'),
(26, '2021-03-15 18:56:45', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'msg'),
(27, '2021-03-15 19:02:01', 'Satyam Toriya', 'toriyasatyam@gmail.com', '+919907729945', 'mgs');

-- --------------------------------------------------------

--
-- Table structure for table `post_content_tb`
--

CREATE TABLE `post_content_tb` (
  `snum` int(11) NOT NULL,
  `heading` text NOT NULL,
  `paragraph` text DEFAULT NULL,
  `list_items` varchar(800) NOT NULL,
  `slug` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_content_tb`
--

INSERT INTO `post_content_tb` (`snum`, `heading`, `paragraph`, `list_items`, `slug`) VALUES
(1, '', 'Coding is not an easy task to be like a normal programmer. But, If you try hard and keep a specific goal in your mind, then it is the simplest thing that makes you great. Let’s see who is in our popular computer programmers in the world for the 2021 year. Don’t forget to tell your favorite famous computer programmers also.\r\n\r\nSo We are going to tell you about the Great Programmers in the World who make our life more reliable and easy. Which these worlds are connected to other people. It is very easy to technology by that coder, developer or we can say that Programmer. They arethe top best Coder of all the time.\r\n\r\nThe Programmer, like the poet, works only slightly removed from pure thought-stuff. He builds his castles in the air, from the air, creating by exertion of the imagination.', '', 'first-post'),
(2, 'MOST POPULAR PROGRAMMERS IN THE WORLD 2021', '', 'Bill Gates (Microsoft co-founder)\r\n , James Gosling (Java Creator)\r\n , Richard Stallman (GNU Project Creator)\r\n , Bjarne Stroustrup (C++ Creator)\r\n , Tim Beners-Lee (HTML and WWW  inventor)\r\n , Ken Thompson (UNIX Co-Creator)\r\n , Linus Torvalds (Linux Kernel Creator)\r\n , Dennis Ritchie (C Programming language creator)\r\n , Jack Dorsey (Twitter Creator)\r\n , Ruchi Sanghvi (FB’s first female engineer)\r\n , Drew Houston (Dropbox Creator)\r\n , Mark Zuckerberg (FB Creator)\r\n , Larry Wall (Perl language)\r\n , Yukihiro Matsumoto (Ruby interpreter)\r\n , John Resig (Jquery, Javascript Library)\r\n , Phil Katz (ZIP format)\r\n , Rasmus Lerdorf (PHP Creator)\r\n , Niklaus Wirth (Pascal Creator)\r\n , John McCarthy (Lisp)', 'first-post'),
(3, '', 'Every year, we scour Indeed to review the top programming languages based on what employers are looking for from applicants. Specifically, we look at which languages crop up most often in job descriptions and compare it to previous years. To truly understand how we chose the top programming languages of 2021, thought, we need to dive in and look at our previous top seven.', '', 'second-post'),
(4, 'Every programming language’s demand dropped because of coronavirus', 'As you can see, all the bottom bars are shorter. Python has dropped from around 74,000 jobs to 70,500. It’s a similar story across the board: a 5,000-to-10,000-job dip per language.\r\n\r\nCoronavirus is likely to blame here. Obviously, we can’t categorically confirm that, but it would seem clear that a global pandemic is going to reduce the number of jobs. Considering how severe things have been, we’re surprised the drop wasn’t worse.', '', 'second-post'),
(5, 'What are the top programming languages of 2021?', 'The top 10 programming languages of 2021 are:\r\n', 'Python \r\n, SQL\r\n, Java\r\n, R\r\n, Visual Basic\r\n, JavaScript\r\n, C++\r\n, C#\r\n, Objective C\r\n, Ruby', 'second-post'),
(6, 'What is Python ?', 'Design and created by Guido van Rossum in 1991, Python is a high-level, interpreted programming language. Python has an object-oriented approach aim to help programmers to write clear and logical code. The language is dynamically typed and garbage collected in a general-purpose programming language. The language supports multiple programming paradigms, including object-oriented, structured, and functional programming. Python was conceived in the late 1980s as a successor of the ABC language. By 2000, advanced features like list comprehensions and garbage collection systems with reference counting were added to Python.', '', 'third-post'),
(7, 'How Do I Learn Python?', 'Python is an easy language with simple syntax. Python is becoming popular day by day as it is the major backbone of new technologies like data science, machine learning, and artificial intelligence. So several educational websites are offering the best Python courses. You can also check out Python tutorials on Hackr.io to begin your journey as a Python developer. If reading books is the way you like to study and learn, you may want to check out these best Python books that we have shortlisted for you.\r\n\r\nLater in your learning journey, when you feel like going the extra mile and testing your skills, you may also want to get certification to become a certified Python Developer. Please read the best Python certifications for your guidance. Lastly, I would recommend you stay focussed, motivated, and encouraged to stick throughout this journey and make it till the end.', '', 'third-post'),
(8, 'What is Python Used For?', 'With a vast number of advanced features that Python offers a huge number of applications. Google, NASA, CERN, Yahoo, Wikipedia, are the major platforms that use Python for their development. Let us see the major uses of Python below:', '', 'third-post'),
(9, '1. Web Development', 'Python offers pre-built libraries and frameworks such as Pyramid, Django, and Flask; web applications can be developed rapidly. A framework is made with common backend logic & several libraries help integrate protocol such as FTP, HTTP, SSL, and processing of XML, JSON, and much more. Python Frameworks provides unparalleled security, scalability, and convenience as compared to building websites from scratch.', '', 'third-post'),
(10, '2. Scientific Computing', 'Python has a list of science-friendly & science-specific libraries & is thus used for scientific research and computing. Some popular Python libraries for Scientific Computing are :\r\n\r\n Astropy for Astronomy  \r\n, Biopython for biology & bioinformatics\r\n, Graph-tool for static analysis of graphs\r\n, Psychology for neuroscience & experimental psychology', '', 'third-post'),
(11, '3. Data Science & Visualization', 'Data is a treasure in this era of technology. You can earn a lottery if you know how to extract relevant information from the data and calculate risks to increase profits. Python libraries like Panda, Numpy help in extracting information from the data.\r\n\r\nAlso, Matplotlib, Seaborn, is data visualization libraries that help visualize data like plotting graphs.', '', 'third-post'),
(12, '4. Machine Learning', 'Machine Learning is different from data science & so are the Python libraries for ML. Machine Learning is about training the computer & making it learn through past experiences or patterns using the data stored or creating algorithms through which the computer learns itself. ML offers applications like recommendation systems on Netflix or Amazon & speed recognition. Python plays a vital role in providing ML libraries & frameworks like Sci-kit learn, TensorFlow & more.', '', 'third-post');

-- --------------------------------------------------------

--
-- Table structure for table `post_tb`
--

CREATE TABLE `post_tb` (
  `post_id` int(3) NOT NULL,
  `title` text NOT NULL,
  `subheading` text NOT NULL,
  `posted_by` text NOT NULL DEFAULT '\'Admin\'',
  `date` date NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(20) NOT NULL,
  `slug` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_tb`
--

INSERT INTO `post_tb` (`post_id`, `title`, `subheading`, `posted_by`, `date`, `img_file`, `slug`) VALUES
(1, 'Greatest programmers in the world 2021', 'This article is About The Greatest Programmers in The World.', 'Admin', '2021-03-13', 'post1.jpg', 'first-post'),
(2, 'Top Programming Languages Of 2021', 'This article is About The Top Programming Langauages in 2021.', 'Admin', '2021-03-13', 'post2.jpg', 'second-post'),
(3, 'What is Python Used For?', 'This article is About The What is Python Used For. ', 'Admin', '2021-03-13', 'post3.jpg', 'third-post');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_tb`
--
ALTER TABLE `contact_tb`
  ADD PRIMARY KEY (`snum`);

--
-- Indexes for table `post_content_tb`
--
ALTER TABLE `post_content_tb`
  ADD PRIMARY KEY (`snum`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `post_tb`
--
ALTER TABLE `post_tb`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_tb`
--
ALTER TABLE `contact_tb`
  MODIFY `snum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `post_content_tb`
--
ALTER TABLE `post_content_tb`
  MODIFY `snum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `post_tb`
--
ALTER TABLE `post_tb`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post_content_tb`
--
ALTER TABLE `post_content_tb`
  ADD CONSTRAINT `post_content_tb_ibfk_1` FOREIGN KEY (`slug`) REFERENCES `post_tb` (`slug`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
