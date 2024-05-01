-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 08:38 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitaldata`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--
/*
CREATE TABLE `data` (
  `patientName` varchar(100) NOT NULL,
  `patientAge` int(11) NOT NULL,
  `diagnosis` varchar(100) NOT NULL,
  `treatment` varchar(100) NOT NULL,
  `admissionDate` varchar(50) NOT NULL,
  `dischargeDate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
*/
--
-- Dumping data for table `data`
--

INSERT INTO `data` (`patientName`, `patientAge`, `diagnosis`, `treatment`, `admissionDate`, `dischargeDate`) VALUES
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Rahul Kumar', 45, 'Pneumonia', 'Antibiotics and rest', '2024-04-28', '2024-05-05'),
('Priya Singh', 35, 'Fractured leg', 'Leg cast', '2024-05-10', '2024-05-17'),
('Ananya Patel', 50, 'Heart attack', 'Angioplasty', '2024-06-05', '2024-06-12'),
('Amit Gupta', 60, 'Appendicitis', 'Surgery', '2024-07-15', '2024-07-20'),
('Neha Sharma', 28, 'Migraine', 'Medication and rest', '2024-08-01', '2024-08-08'),
('Riya Verma', 55, 'Arthritis', 'Physical therapy', '2024-09-10', '2024-09-17'),
('Vivek Mishra', 42, 'Diabetes', 'Insulin therapy', '2024-10-05', '2024-10-12'),
('Shreya Singhania', 32, 'Gallstones', 'Surgery', '2024-11-15', '2024-11-20'),
('Manoj Tiwari', 48, 'High blood pressure', 'Medication and lifestyle changes', '2024-12-01', '2024-12-08'),
('Pooja Dubey', 37, 'Anxiety', 'Therapy and medication', '2025-01-10', '2025-01-17');
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
