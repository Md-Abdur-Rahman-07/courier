

SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;
SET time_zone = "+06:00";



CREATE TABLE `branches` (
  `id` int(30) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_code`, `street`, `city`, `state`, `zip_code`, `country`, `contact`, `date_created`) VALUES
(1, 'ch001', 'Mansurabad', 'Chittagong', 'Chittagong', '4000', 'Bangladesh', '+880123456789', '2025-01-25 10:30:00'),
(2, 'dh002', 'Gulshan Avenue', 'Dhaka', 'Dhaka', '1212', 'Bangladesh', '+880987654321', '2025-01-25 11:00:00'),
(3, 'ct003', 'Agrabad', 'Chittagong', 'Chittagong', '4100', 'Bangladesh', '+8801122334455', '2025-01-25 11:30:00');




CREATE TABLE `parcels` (
  `id` int(30) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `sender_name` text NOT NULL,
  `sender_address` text NOT NULL,
  `sender_contact` text NOT NULL,
  `recipient_name` text NOT NULL,
  `recipient_address` text NOT NULL,
  `recipient_contact` text NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = Deliver, 2=Pickup',
  `from_branch_id` varchar(30) NOT NULL,
  `to_branch_id` varchar(30) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `width` varchar(100) NOT NULL,
  `length` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `parcels` (`id`, `reference_number`, `sender_name`, `sender_address`, `sender_contact`, `recipient_name`, `recipient_address`, `recipient_contact`, `type`, `from_branch_id`, `to_branch_id`, `weight`, `height`, `width`, `length`, `price`, `status`, `date_created`) VALUES
(1, '201406231415', 'Md. Hasan', 'Mirpur, Dhaka, Bangladesh', '+8801712345678', 'Rifat Karim', 'Agrabad, Chattogram, Bangladesh', '+8801612345678', 1, '1', '0', '30kg', '12in', '12in', '15in', 2500, 7, '2020-11-26 16:15:46'),
(2, '117967400213', 'Sabbir Rahman', 'Uttara, Dhaka, Bangladesh', '+8801912345678', 'Afsana Jahan', 'Zindabazar, Sylhet, Bangladesh', '+8801512345678', 2, '1', '3', '30kg', '12in', '12in', '15in', 2500, 1, '2020-11-26 16:46:03'),
(3, '983186540795', 'Sharmin Akhter', 'Mohammadpur, Dhaka, Bangladesh', '+8801812345678', 'Nayeem Islam', 'Barguna, Barisal, Bangladesh', '+8801719876543', 2, '1', '3', '20Kg', '10in', '10in', '10in', 1500, 2, '2020-11-26 16:46:03'),
(4, '514912669061', 'Tania Rahman', 'Nasirabad, Chattogram, Bangladesh', '+8801918765432', 'Rakibul Alam', 'Sonadanga, Khulna, Bangladesh', '+8801715432198', 2, '4', '1', '23kg', '12in', '12in', '15in', 1900, 0, '2020-11-27 13:52:14'),
(5, '897856905844', 'Fahmida Parvin', 'Gulshan, Dhaka, Bangladesh', '+8801617654321', 'Tanvir Ahmed', 'Boyra, Khulna, Bangladesh', '+8801713547865', 2, '4', '1', '30kg', '10in', '10in', '10in', 1450, 0, '2020-11-27 13:52:14'),
(6, '505604168988', 'Imran Hossain', 'Banani, Dhaka, Bangladesh', '+8801712348765', 'Sadia Sultana', 'Sherpur, Mymensingh, Bangladesh', '+8801912348765', 1, '1', '0', '23kg', '12in', '12in', '15in', 2500, 1, '2020-11-27 14:06:42');


CREATE TABLE `parcel_tracks` (
  `id` int(30) NOT NULL,
  `parcel_id` int(30) NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `parcel_tracks` (`id`, `parcel_id`, `status`, `date_created`) VALUES
(1, 2, 1, '2025-01-27 09:53:27'),
(2, 3, 1, '2025-01-27 09:55:17'),
(3, 1, 1, '2025-01-27 10:28:01'),
(4, 1, 2, '2025-01-27 10:28:10'),
(5, 1, 3, '2025-01-27 10:28:16'),
(6, 1, 4, '2025-01-27 11:05:03'),
(7, 1, 5, '2025-01-27 11:05:17'),
(8, 1, 7, '2025-01-27 11:05:26'),
(9, 3, 2, '2025-01-27 11:05:41'),
(10, 6, 1, '2025-01-27 14:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Developed by Eshan & Niloy', 'info@sample.com', '0155556666', 'Chattogram, Bangladesh', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(4, 'Abdur', 'Rahman', 'eshan.ar07@gmail.com', 'eshan31', 1, 0, '2025-01-26 10:57:04');

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(1, 'Abdur Rahman', 'Eshan', 'eshan.ar07@gmail.com', 'eshan31', 1, 1, '2020-11-26 10:57:04'),
(2, 'Shafkat', 'Niloy', 'niloy.10@gmail.com', 'niloy10', 1, 2, '2020-11-26 11:52:04'),
(3, 'Md', 'Raihan', 'raihan.02@gmail.com', 'raihan02', 2, 3, '2020-11-27 13:32:12'),
(4, 'Md', 'S Raihan', 'raihan.29@gmail.com', 'raihan29', 2, 3, '2020-11-27 13:32:12'),
(5, 'Md', 'Tasrik', 'tasrik.23@gmail.com', 'tasrik23', 2, 2, '2020-11-27 13:32:12');

-- update users
-- set type=1
-- where id=3;

--
-- Indexes for dumped tables
--


--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

