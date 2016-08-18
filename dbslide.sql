-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 18, 2016 at 04:57 PM
-- Server version: 5.6.31-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbslide`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `name` text,
  `alias` text,
  `author` int(11) DEFAULT NULL,
  `created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `name`, `alias`, `author`, `created`) VALUES
(3, 'wedding Thế Phúc vs Nhật Huyền', 'wedding-the-phuc-vs-nhat-huyen', 5, '2016-08-17'),
(6, 'Phượt miền tây', 'phuot-mien-tay', 5, '2016-08-18'),
(7, 'Phượt Cà Mau', 'phuot-ca-mau', 5, '2016-08-18'),
(8, 'Phượt Vũng Tàu', 'phuot-vung-tau', 5, '2016-08-18');

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `id_album` int(11) NOT NULL,
  `caption` text,
  `image` varchar(200) DEFAULT NULL,
  `link` text,
  `created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`id`, `id_album`, `caption`, `image`, `link`, `created`) VALUES
(6, 6, 'xuống mương bắt cá :))', NULL, 'https://f1sbfg.bay.livefilestore.com/y3pjvltsOTgS00RUkvadqefvmHCkmApiez47gEESfVsttM55a5reh9e4EGH3oQagiwe2rf-KnZVWVHxVGY9Jv4FjSAFee1gNciylzMsGnn__nzNpeDnSpW-l1WKoqhXCBLp_1iuqa9e7Gjj6TIfbqf2WQ/IMG_20141122_102735.jpg?psid=1', '2016-08-18'),
(7, 6, NULL, NULL, 'https://vblqpw.bn1301.livefilestore.com/y3p_yrb4hm59vwlCd9dOTsQ_kW99sExvMTlrIrEdJXtgddDg8WecbnRT_u3QUtzF86_2YavtpL2qFHbHkorDeFHPlM97lkAn3aJVhv15TvgyMScoipgTRqdzneNdGsqyVb7EMgmn-5la5nWygnY37Fcp9eMIU1AvlQylsOHAGPF5Yc/IMG_20141122_094830.jpg?psid=1', '2016-08-18'),
(8, 6, NULL, NULL, 'https://vblqpw.bn1301.livefilestore.com/y3p0wwNcN8hJth907i_6kVvTPrfb_rIAGQHBagq-WHFS4LWHnmnnu4V9tgkU7i82TXDuMWnLekWYx6aKZaGqYzWC4VhI-5DtUQQP-5I_G0cifkGE-NcExWnmoZegY4c7V-zy7mvb3U-mXOWnDxRxQKzkD7TB3Raj6cYO5anr85NEzk/can%20tho.JPG?psid=1', '2016-08-18'),
(9, 6, NULL, '', 'https://vblqpw.bn1301.livefilestore.com/y3pWZW4IYxDdFBtPq9oOs45oJHE4XIN1UOYK-sYUzodaLaVwoHWd89_cmXC3Ou1ddunoZuzp68_qq9Eol1GTlANb_Wl5KHdTMq_oS5tDqmhVkj_d1_1U7jUcLpkDAuO7Bln5VHzDQj81OPuBFIXB3xK4bOQ3DEInsvruqA10wKxgLE/DSCN0770.JPG?psid=1', '2016-08-18'),
(10, 6, NULL, NULL, 'https://vblqpw.bn1301.livefilestore.com/y3pUDEujw-wTH6smYdq5Ix9BIfoZC-_ExaNyZWJLIGA5CkkfFHfmM8mJdTzPZ50PauZsZDQpv2aJWoDJGur_5540iCi-R0ziYidd3Ny9TjWGlxQ04k6ovp3vtMpT58UZRNZZaJ7CSQZxb1wCPp0SLyfUvG_eJoJi76DLZRJZoBSE7E/DSCN0732.JPG?psid=1', '2016-08-18'),
(11, 6, NULL, NULL, 'https://vblqpw.by3301.livefilestore.com/y3phS1UG11PEdAyPmvgtsv1VxC4PBJEn_8ie_pWzp2rjUSJ7rjr6UFIN70MMcdV2gDuYT8xGF4IkkmY9tddq7k7GvslsWqAcNYAjD_rSKyDkwq42Nsv414_mm2Ks0BYWJTXeggIMJUTKn_JUgEpKlyZY43nzS_FtOQ2f78eRfEUh3I/DSCN0736.JPG?psid=1', '2016-08-18'),
(12, 6, NULL, NULL, 'https://vblqpw.bn1301.livefilestore.com/y3puV937r8_6gu7Yc58cZXHFUI-wvsufe4y4rtv65cFnHa6lV-qslgwVK1Sm6OGBvDBWA4DCLSf0ebJ2x261tS4j3pEtS1nhGNnSj_3rUEcNwFzM6NQpO25rGb7F0lQhOQZco_D60JJWMPCG-HjiWCaNN0be_I0ADbYICJ6c8VoC0w/DSCN0762.JPG?psid=1', '2016-08-18'),
(13, 6, NULL, NULL, 'https://vblqpw.bn1301.livefilestore.com/y3pjRE5n17_oq_Ch1_Q19aCxfHQYWMpOAOpdOW16lfkdZ-w_fIpvatIwU_6O9ZksZW_7gH-Qwd0ZlBReolxSdWhWaZTYO90ovzhAdmIkHyyLtG8iW_LBNW0G59T75EY_Qc77sqyp9nU2QfThtCWK_7MtdbR0AVU-Vb8KL1TbaP2Gvk/DSCN0780.JPG?psid=1', '2016-08-18'),
(14, 6, NULL, NULL, 'https://vblqpw.blu.livefilestore.com/y3pjjORkYR5VT2xl6jyBUgdn4mGMxmlvIeZ2clkLcYoP4lyH8AsmbMoJ9hWOjT3MJgX-h7AXVqUnYvJmqjl0qR8SHumHBqS5kpFVJW8P7WiENKiqUcXghGYd3b-qWT66esEhnttwY5b3GSO7ZQzu33XF4_Zi1Kfd0fqccvd6E_RuvQ/vk%20iu.jpg?psid=1', '2016-08-18'),
(15, 6, NULL, NULL, 'https://vblqpw.blu.livefilestore.com/y3pyVsY4c7ketHzIVCbFebdHGSNIEkIkkRiUUUsPF4bjyODOYteLMhWtzzdnbNeyULNoDs1eqT0Xs-L2IEoAHS04Pmhropa5Y0VAXNWVfmtNL-jrPsBV8gcVut4VPckuBQROp8rSw9cFQgZNhHul101QgQbEEGiF87iLCdvVm4t084/DSCN0782.JPG?psid=1', '2016-08-18'),
(16, 6, NULL, NULL, 'https://vblqpw.bn1301.livefilestore.com/y3pV9s6mevRvQfrCwpRaBHI-zluNrpv8YCJ7ph6IshO7IGbRKIEzl7O60nuh9p6lsCaDCsM7UvxEc9b75yHaac3QDSABVtU95vla9ZcChYwi6GQkUCfR5jy-K7VEPpbTh-WX6moufsy05iJPz-37VsSyO1j65imHYzv1TIrI1_R02s/phuot.jpg?psid=1', '2016-08-18'),
(17, 6, NULL, NULL, 'https://vblqpw.by3302.livefilestore.com/y3pVYb3oZ3OsyyJTK_DDoXUf_4JHU86HgYtbWXxlC3Li4MdKdnvPZsKCjBHTYJK2GfXBtaFSM2ttt5DeAXN8RR-0-FJYBLbc9AOIqrh0OFoSRnBzeWQhUvKa_f2myPl8DZJ282oKwNQ1BVMN2j71EoZMJvlOcEcuYRCq4Q-c71DZCc/DSCN0781.JPG?psid=1', '2016-08-18'),
(18, 6, NULL, NULL, 'https://vblqpw.bl3301.livefilestore.com/y3pY_vc8X9GVHo1t-VpSi2rByYcuqNkAe-SRcjGozrFtH4dC-7eOqK1H6ADQSq2h2JWhRG_hD3CDtsgGTB5wNq1DmlapsV0vRHTMO6b8UGDBL9-fEwEo6CFv5RssNmAjOW0i1ziHDYPKSZVUZvBmg3ERcEXroze8TOMaIAhfXoPiYs/DSCN0773.JPG?psid=1', '2016-08-18'),
(19, 6, NULL, NULL, 'https://vblqpw.by3302.livefilestore.com/y3p6f9md3HkMGoxE6BIdJoo61VsAYqwqzRA-ZDs3eulc_M4XKQoGQntGCCo6A2Rztp3s2W2bqtPdwwrpY5Ugmrr500UnJq06FizOZohnPVKc8OIXbOSqr6K-S3QAWEUqLGQyB25o4LXz2kaHaLVKX8HyL4JUfAI6PZ1KNE6E3yFkMg/DSCN0703.JPG?psid=1', '2016-08-18'),
(20, 7, NULL, NULL, 'https://vlnkbw.bn1301.livefilestore.com/y3pBHJon2Lk4HhAgsCv-p4LM2LDA43GgKDIgSf-NNrXFvoDScEeoIGnjAUOrxkmbdfLB2Cd7tE5WHbKtQQ8HCrI_akfaoh3FvRkLp9uzA0Houo7vermd5Q0XfJOOoMLvkBz6PHbAOLLsLDDFReFhvz_IHMbBwDLdYwaW4cqukj-guk/11219698_778332882281748_376088497888581381_n.jpg?psid=1', '2016-08-18'),
(21, 7, NULL, NULL, 'https://vlnkbw.bl3301.livefilestore.com/y3pIh-wkRSkfSm0kgDg4a_bfyP1KIttNOjNxMFUW1hfI2f6-LOb37BxP7atQk97akeWQA9DDVgv86fT7Gw-Q-IcJZ1Ue6SM4CJ7pBjyldWq2ZgFQbZBwJNRFz4bN_xT6vzyoVXj_sgOuutRLac_fJ3Wg79WfvA9Gss5VzF7kuElEYs/11058328_778332702281766_5406769411090522882_n.jpg?psid=1', '2016-08-18'),
(22, 7, NULL, '', 'https://vlnkbw.bl3302.livefilestore.com/y3pz8_Z-ViGVuR3HwLI_CbE1vT1L5BZEyxEuNAgPQcaOX1M2JK6UyAjxhPetwHqOXNfNJsyPnQK713uYl5cDaQEQ2SEWVbnsVPMt6vaLhQmTKE39SJ50VUoY5nLGoEiS736CYyn-6NmZQM4viKiIdOzRD6vrEdtuvGlbPhn4eDE9rc/11329866_778332395615130_1050672964240915814_n.jpg?psid=1', '2016-08-18'),
(23, 7, NULL, NULL, 'https://vlnkbw.bn1301.livefilestore.com/y3pGa3Y_Anct0ynmJRoe2cDQANUqfZhgghbsXxPQYytRFM76IlpePv0PIrtbWlxxeVcdWIxBQemBnq2DgtoGowXMFO1eYXdXRE1cYRMb3WQfvntLO3Q4jyKdeCSpgzYkNjnQEk9_JW75fOIfJObOsY30IkMjR_oPlE4Fz39L62byo8/10470634_778331948948508_2849513385270339584_n.jpg?psid=1', '2016-08-18'),
(24, 7, NULL, NULL, 'https://vlnkbw.bn1301.livefilestore.com/y3p94f2Qxy3s9FvvrWk4nT-lOXxgr556RzbcCi6hcALBFODccu7LT_RZv4_o5U7VRzvnkmafXwMqg0fGoS_iBuN3qDSS-bMooGoaNwMWWjpcwPgf7uSB20TZ5WR2RaKd10FXXartv0Wc1ZDV2-o0jfmPruLvjqWfVol3dYMbWOE_T4/10169241_658486450951471_9108139484707641830_n.jpg?psid=1', '2016-08-18'),
(25, 7, NULL, NULL, 'https://vlnkbw.bn1301.livefilestore.com/y3p9HiBLEvttDL4HdtVlm5WX3YlO0YQzfpjGqDK-5cb-p_7Kw4EB1WG-gnG_oMEiXKBFzlXuDBq90gX_VV14Cj8n4ocXc8wx24Yy-ihqt869aHQ5hZrppwrC2H_jhwAO3O9oisqRseeeVbQY_Lp2Y0r-Sp3k6OFHUujDchLyfkHdqE/11232171_658483707618412_4825805402905839997_n.jpg?psid=1', '2016-08-18'),
(26, 7, NULL, NULL, 'https://vlnkbw.by3301.livefilestore.com/y3phqOx0Oaz-FQmAEtwjWdgEmisCGt9T44JNjIl_zAPFCIBHgueHAcIqENHepytSzFyF78VFgVrzVr17PYYuGiaAPosKpMBiXa803JBv_TMrsJXHnJB9lg1Y9yyGi8ei0ULSbCN7R4uxS6MWQxg37sVH2zTBLSgoWXLO-Up1QusLkg/11012764_658487040951412_3295977152261796948_n.jpg?psid=1', '2016-08-18'),
(27, 7, NULL, NULL, 'https://vlnkbw.bn1301.livefilestore.com/y3pS0gOJMmaRC-AjeeyMyCvSi_8rJm1Tkq3ea-CIyIakOAdMeLIoiJFZXcy_d8LHBjv6e5UcNxQ3RoAEiyw_vG4-TeG6Zj8CgyTi0UmiqKNa0bMzxWGJiUjK2_NWE8MMOj9AlRrM16e_rIuThvXQ1stMJnuvyIowP387wJBhFvVN9A/10985196_658487034284746_6045230329277720839_n.jpg?psid=1', '2016-08-18'),
(28, 7, NULL, NULL, 'https://vlnkbw.bn1301.livefilestore.com/y3pxeZhhjmQVK8ZoHUbUODKU6WkYC3NLa9JLgs4Dsfy_I9Zky5lCZIree_F4daWDZiOEJUSW3k8EmzzwlKlFcYxIEk4Xor57osTdx3Y23bX8unvYzndjRzk1fp3GN6HlRupm5JFb3ZXi8EyA-9m8ea0Se2BtLb4-kN6qKdh5U9DaQ4/10423975_778332878948415_3543962196872181560_n.jpg?psid=1', '2016-08-18'),
(29, 7, NULL, NULL, 'https://vlnkbw.bn1301.livefilestore.com/y3p725DJDfLFto5dusEYOh8l7yvWZt-L754eHnG4pthinTRyrLS8g9kQQydtXp4aTSKTtZ0LXfiKneRdbY44ClfPGGHKPcF8ZAzfBE_TSEfFzArgGA0W92VYkszq8RmS_dzKqUMfLPQ00lsyFsJDe-igeDTRQMZ0MVaOvh3Z6LMRAk/22591_658341594299290_1318497332724315278_n.jpg?psid=1', '2016-08-18'),
(30, 7, NULL, '', 'https://vlnkbw.bl3301.livefilestore.com/y3pAgvk5NRVCj3PiiEy3ZiP-Xwpo_AK25GOEmsIvG8i5Kf4_nJtBfbBblPdgAmGTO79oSoUemhbKDzunGoeMfXgaaZBu-1psNNi1A8wf6QZPZUGedxNObOQ4EQ3ReZhbDpKqyKxzc9Wzkwr621RovgHXS1bKrpVrtM9YO68T4U1zZg/1534894_659388977527885_2857949476900734687_o.jpg?psid=1', '2016-08-18'),
(31, 8, NULL, NULL, 'https://vblrpw.by3301.livefilestore.com/y3pm6SlPDMBKCTk8JReaCzaLlbP0B-mvYq8GMKVBI3n-HKRlS9g29N_XdBCPug524v4-nrEABIRJfG4_0WOJIaXnJVJy1Y4gw_33N1mQUIZUCOfKzPo6T7WK1-S9NDHxlduaZ9id6VE91StkXEyH-iYwIba2zh5fB5cTCkUAd1oWms/DSCN1052.JPG?psid=1', '2016-08-18'),
(32, 8, NULL, NULL, 'https://vblrpw.bn1301.livefilestore.com/y3pUfRfJFnnI3aihZKQGQpuuWO04p3PfNJPlJ7GAjD_RlCPJN8GAtiOCLoa0FmWYTmYBEDun5WtZ4sbL_QT3kHfuvhTtzFLx4rZqlqAGsgs4enr-ehMOfTGzgXJmZ7ShWYk2R2DbX6uL3i8gnfMbS81g6UKzASz2B_S8fSeckXropw/DSCN1060.JPG?psid=1', '2016-08-18'),
(34, 8, NULL, NULL, 'https://vblrpw.bn1301.livefilestore.com/y3paSO6v01hvYCpd6rpn-mfXpKRu-xYxP-Gj_a0h6iTMriRpwLZ9iDgwZGN6v4GTW8dK3tA55seRJ4LeNRJet9EvMTetq-sfAsPOCK-KnClsVS-Tf0a44COobWSOTyALRzQmOtJxGoS1dypoqMay7HYlv1F2BsetCCDk3KRHhYK6AQ/DSCN1059.JPG?psid=1', '2016-08-18'),
(35, 8, NULL, NULL, 'https://vblrpw.by3302.livefilestore.com/y3pmMg5uPZ2yvw14gaWk50cDbhrWkkvCdtoXAYIHgnZIqMe_ru1dijbEWBodQTPa3R12FqA2g-yY83UKQpbgxv0r7jlopKTK5TR1f-h5AKOz_Cd9zy6_CFSI9WzYgbYGe-qiSMOH1yFNpmxdi3zfGlMwlDEwgZ9hA0p1ERuoxRW7lg/DSCN1044.JPG?psid=1', '2016-08-18'),
(36, 8, NULL, NULL, 'https://vblrpw.bay.livefilestore.com/y3pq5jexHnX4krUwI0P3z1-F4dxfrGriGIUFHXx-vwJFvMMj7kYkbqFn_z4v-yDHBCkq0sv5FPzjXYrhzjOfpvJI54-ASq5ugPzai0lE5yEby_9iYM4O8mLqmOejOOH1g4c5q3dA_y_64tSb683CzYgpR8EqLhm4QsZ4a96kPTJ9ns/DSCN1042.JPG?psid=1', '2016-08-18'),
(37, 8, NULL, NULL, 'https://vblrpw.bn1301.livefilestore.com/y3pVyQmq4H1TTlm6BB862fd9ArExe-ZrSRtvYrqdLzjmE2I804AoJhfeYiTglYo7PwOMSy97DAczK9HbhrOzmEW-fKKQeqI0lZnY8DPGTqdD74dBiGAdm36UzxZRm1ErqsTBgMIIO8C8APCGCKa84ubY2JjGCh_WrASr41l9gJNr48/DSCN1043.JPG?psid=1', '2016-08-18'),
(38, 8, NULL, NULL, 'https://vblrpw.bn1301.livefilestore.com/y3pjSK6fuw3wnde-8EBIMX7ijD1aol2tWeiclgn5IBNozqHmoUykYlYFw-Nc0djv9hI9Pl4dOAvKy2SR6NuCbwBsj2EHDgP7bF0YetNEAA12Ix-uPmfa1D5JT5OhItyclYbHfHij2s838kv9RdcAW2TNvd0wIQaYyQYdhPsatb0-HU/DSCN1050.JPG?psid=1', '2016-08-18'),
(39, 8, NULL, NULL, 'https://vblrpw.blu.livefilestore.com/y3p1CIkWZEXSWEdxIdSztLQox7bpYDLRqbVEF0xOpV3Tr7KJRgKOwh6rDcxhvR8Zy6LTw_-niHO29V-2v3ZuzcA4scaVJuG0-Giv1e9aHbS6BHYBFK5epY1w-0JicSzWHIN3-YCIXiDi0CB5sl-5ZJ4LR3aj2sNmzmlQQdtWnCJzaw/DSCN1065.JPG?psid=1', '2016-08-18'),
(40, 8, NULL, NULL, 'https://vblrpw.bn1301.livefilestore.com/y3pcZ545nB7rlpxvQOaxtFp67bYgrI4Fjeb6qVHzK2E6Q3KoQzr59JnyooXTz852kLn5hWxNJVtPlFVc1bMCCsVjZoj4FY64tKgVSVVrgbz1PseS-5xS4KJzoHVRFWDrHmkNElITut5A095_7dTXxX6x0CZ-ypm6azCBFoOYHtQn9c/DSCN1070.JPG?psid=1', '2016-08-18'),
(41, 8, NULL, NULL, 'https://vblrpw.bay.livefilestore.com/y3pz7awwKjivWjPU1MAiDIVo4ppkZ65Kh0PTmywhQ-4twvAhSB7qy8-65mSbu8J4UHp5bBChN023WSs3duzXVNegHjDSHLrP3PbJl96dhfGHmPMbSJYZAve8xRVLCLpQ5bi-oUWO7dnufoAuTY3gkUIf_FOCD2MVjJm7McuDIWzAjU/DSCN1037.JPG?psid=1', '2016-08-18'),
(42, 8, NULL, NULL, 'https://vblrpw.by3301.livefilestore.com/y3pBETegb7RvgWSqT21z0Pb1lwrv5pZJov8FKd22qKxZdeC7AuqHY1G-blxJbFsJOMej_D-Dv8QUJd9TN-1ehEsZuQfu0Shcx3GDop_VDOwgXn8BA8srKLZA2aL2091wFkuUi0L3Sh3Lkc_5_q7lm082luno1bwy734Y4NfGcISaXQ/DSCN1035.JPG?psid=1', '2016-08-18'),
(43, 8, NULL, NULL, 'https://vblrpw.bn1301.livefilestore.com/y3pWHuMyM82zHitJGq2SL6fd60sXf4O3ekJdsvOlYap8moOPkrJlbAPENrKHBVngIKh38Znmxkhz5pottt94vz06Nr0nYg5-ZufzIFq_isC7XavBgIihDjuRJC-pLBQ5hDtGTMcqdwkYttVNrfUCmWic_eYOeIHx4hXn8fSf9T3eaQ/DSCN1040.JPG?psid=1', '2016-08-18'),
(44, 8, NULL, NULL, 'https://vblrpw.bn1301.livefilestore.com/y3pI6WbCFcRe4v5l-IRplSwWM5dYc1198C6bgcii7C4t1JDaCkAHr6iBSDs4DlzhSV2Frx3IyUNJkzwmCz6VAiaaDFTRhTGgdhhUPOx8M9i-mBYHG0RWUNzc4YVRbhFriy4mdPjkAF26mde3TZRToBFaHAzRbMD5HJqxrc931tS7fc/DSCN1084.JPG?psid=1', '2016-08-18'),
(45, 8, NULL, NULL, 'https://vblrpw.by3302.livefilestore.com/y3pid1BEZ-dIzSTgeuAtbQnMLcJ3TztT3Ju31xPTGAyxBwGgZXMzafbsvlcjMuEOh0xlln4CUyB_57xowiT-yS5PSuC449juPR5QWHO6AvmntcMlHrWhq0tKDYOeCm6vlGJJ7PLXlJseO0Czf3SK89CFqFH_q6pFmGEnHvQ-oW5NHc/DSCN1091.JPG?psid=1', '2016-08-18'),
(46, 8, NULL, NULL, 'https://vblrpw.bl3301.livefilestore.com/y3p8t-cHA8OfSbQIbW89RjCNQyNxL-QcCDzAJMms9vkdTeQaPiFExqQty_VWoCMOxiJU9E4zGrVq6VJbLQACnEiO-ozmf1r_8mXU5PXx3zNzs-yCyTg7kULlndRk7g4xu10ruIEz4d1Fl8DYnynzk83ZA8Ey3qsDBGGA1dbPECYyDY/DSCN1086.JPG?psid=1', '2016-08-18'),
(47, 8, NULL, NULL, 'https://vblrpw.bay.livefilestore.com/y3p4CXYXwFvZyS4K7tVxqinsCUGgRZG6kLBIkkZTsqc68zf7A-y07tjrAowMoWv2cPe7Xhy83uavfcB2Qbv5IQVHdehYtdKx4Hxxe6QLNMTlvmh3RoNyUnHQKCIVaG5IqcWbn6OocdRyyZTTL3i0u-J2rT2ms_8OgPr0aui_VlCruc/DSCN1085.JPG?psid=1', '2016-08-18'),
(48, 8, NULL, NULL, 'https://vblrpw.bn1301.livefilestore.com/y3pI6WbCFcRe4v5l-IRplSwWM5dYc1198C6bgcii7C4t1JDaCkAHr6iBSDs4DlzhSV2Frx3IyUNJkzwmCz6VAiaaDFTRhTGgdhhUPOx8M9i-mBYHG0RWUNzc4YVRbhFriy4mdPjkAF26mde3TZRToBFaHAzRbMD5HJqxrc931tS7fc/DSCN1084.JPG?psid=1', '2016-08-18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `role` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `username`, `pass`, `role`) VALUES
(1, 'THEPHUC', 'CMS', 'nhathuyen93', '$2a$08$9e0T1jzDjHo7FtWdVGgSo.koVD.EkvZ45Qmh.rAAx/dwdmuH52iIa', 1),
(5, 'Thế', 'Phúc', 'thephuc94', '$2a$08$Tsv4XVvuduVOt2qZajrdH.8giIBIui.hF3IejBNGJe4Nijs6ZX20O', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
