USE [NexGoal2]
GO

-- USE [LumiGoal]
-- GO

CREATE TABLE #EmpIdMapping (
    OldEmpId INT,
    NewEmpId INT,
    CompanyId INT
);

-- NexGoal2
INSERT INTO #EmpIdMapping (OldEmpId, NewEmpId, CompanyId) VALUES
(86, 6033, 1),
(87, 6034, 1),
(88, 6035, 1),
(89, 6036, 1),
(90, 6037, 1),
(91, 6038, 1),
(92, 6039, 1),
(93, 6040, 1),
(94, 6041, 1),
(95, 6042, 1),
(97, 6044, 1),
(98, 6045, 1),
(99, 6046, 1),
(100, 6047, 1),
(101, 6048, 1),
(102, 6049, 1),
(103, 6050, 1),
(104, 6051, 1),
(105, 6052, 1),
(106, 6053, 1),
(107, 6054, 1),
(108, 6055, 1),
(110, 6057, 1),
(111, 6058, 1),
(112, 6059, 1),
(113, 6060, 1),
(114, 6061, 1),
(115, 6062, 1),
(116, 6063, 1),
(117, 6064, 1),
(118, 6065, 1),
(119, 6066, 1),
(120, 6067, 1),
(121, 6068, 1),
(122, 6069, 1),
(123, 6070, 1),
(124, 6071, 1),
(125, 6072, 1),
(126, 6073, 1),
(127, 6074, 1),
(128, 6075, 1),
(129, 6076, 1),
(130, 6077, 1),
(131, 6078, 1),
(132, 6079, 1),
(133, 6080, 1),
(134, 6081, 1),
(135, 6082, 1),
(136, 6083, 1),
(137, 6084, 1),
(138, 6085, 1),
(139, 6086, 1),
(140, 6087, 1),
(141, 6088, 1),
(142, 6089, 1),
(143, 6090, 1),
(144, 6091, 1),
(145, 6092, 1),
(146, 6093, 1),
(148, 6095, 1),
(149, 6096, 1),
(150, 6097, 1),
(152, 6099, 1),
(153, 6100, 1),
(155, 6102, 1),
(156, 6103, 1),
(157, 6104, 1),
(158, 6105, 1),
(159, 6106, 1),
(160, 6107, 1),
(161, 6108, 1),
(162, 6109, 1),
(163, 6110, 1),
(164, 6111, 1),
(166, 6113, 1),
(167, 6114, 1),
(168, 6115, 1),
(169, 6116, 1),
(170, 6117, 1),
(200, 6118, 1),
(204, 6119, 1),
(205, 6120, 1),
(206, 6121, 1),
(210, 6122, 1),
(212, 6124, 1),
(213, 6125, 1),
(214, 6126, 1),
(215, 6127, 1),
(216, 6128, 1),
(217, 6129, 1),
(221, 6131, 1),
(222, 6132, 1),
(223, 6133, 1),
(224, 6134, 1),
(226, 6136, 1),
(227, 6137, 1),
(228, 6138, 1),
(229, 6139, 1),
(230, 6140, 1),
(231, 6141, 1),
(232, 6142, 1),
(233, 6143, 1),
(234, 6144, 1),
(236, 6146, 1),
(237, 6147, 1),
(238, 6148, 1),
(239, 6149, 1),
(240, 6150, 1),
(241, 6151, 1),
(242, 6152, 1),
(243, 6153, 1),
(244, 6154, 1),
(245, 6155, 1),
(246, 6156, 1),
(247, 6157, 1),
(248, 6158, 1),
(249, 6159, 1),
(250, 6160, 1),
(251, 6161, 1),
(252, 6162, 1),
(253, 6163, 1),
(254, 6164, 1),
(255, 6165, 1),
(256, 6166, 1),
(257, 6167, 1),
(258, 6168, 1),
(259, 6169, 1),
(260, 6170, 1),
(261, 6171, 1),
(262, 6172, 1),
(263, 6173, 1),
(264, 6174, 1),
(265, 6175, 1),
(266, 6176, 1),
(267, 6177, 1),
(268, 6178, 1),
(269, 6179, 1),
(270, 6180, 1),
(271, 6181, 1),
(272, 6182, 1),
(273, 6183, 1),
(274, 6184, 1),
(275, 6185, 1),
(276, 6186, 1),
(278, 6188, 1),
(279, 6189, 1),
(280, 6190, 1),
(281, 6191, 1),
(282, 6192, 1),
(283, 6193, 1),
(284, 6194, 1),
(285, 6195, 1),
(286, 6196, 1),
(287, 6197, 1),
(289, 6198, 1),
(290, 6199, 1),
(291, 6200, 1),
(292, 6201, 1),
(293, 6202, 1),
(295, 6203, 1),
(296, 6204, 1),
(297, 6205, 1),
(298, 6206, 1),
(299, 6207, 1),
(300, 6208, 1),
(301, 6209, 1),
(302, 6210, 1),
(303, 6211, 1),
(304, 6212, 1),
(305, 6213, 1),
(306, 6214, 1),
(307, 6215, 1),
(308, 6216, 1),
(309, 6217, 1),
(311, 6219, 1),
(312, 6220, 1),
(313, 6221, 1),
(314, 6222, 1),
(315, 6223, 1),
(316, 6224, 1),
(317, 6225, 1),
(318, 6226, 1),
(319, 6227, 1),
(320, 6228, 1),
(321, 6229, 1),
(322, 6230, 1),
(323, 6231, 1),
(324, 6232, 1),
(325, 6233, 1),
(326, 6234, 1),
(327, 6235, 1),
(328, 6236, 1),
(329, 6237, 1),
(330, 6238, 1),
(331, 6239, 1),
(332, 6240, 1),
(333, 6241, 1),
(334, 6242, 1),
(335, 6243, 1),
(336, 6244, 1),
(337, 6245, 1),
(338, 6246, 1),
(339, 6247, 1),
(341, 6249, 1),
(342, 6250, 1),
(343, 6251, 1),
(344, 6252, 1),
(345, 6253, 1),
(347, 6254, 1),
(348, 6255, 1),
(349, 6256, 1),
(350, 6257, 1),
(351, 6258, 1),
(352, 6259, 1),
(353, 6260, 1),
(354, 6261, 1),
(355, 6262, 1),
(356, 6263, 1),
(357, 6264, 1),
(359, 6266, 1),
(360, 6267, 1),
(361, 6268, 1),
(362, 6269, 1),
(363, 6270, 1),
(364, 6271, 1),
(365, 6272, 1),
(366, 6273, 1),
(368, 6275, 1),
(369, 6276, 1),
(370, 6277, 1),
(371, 6278, 1),
(372, 6279, 1),
(373, 6280, 1),
(374, 6281, 1),
(376, 6283, 1),
(377, 6284, 1),
(378, 6285, 1),
(379, 6286, 1),
(380, 6287, 1),
(381, 6288, 1),
(382, 6289, 1),
(383, 6290, 1),
(384, 6291, 1),
(385, 6292, 1),
(386, 6293, 1),
(387, 6294, 1),
(388, 6295, 1),
(389, 6296, 1),
(390, 6297, 1),
(391, 6298, 1),
(392, 6299, 1),
(393, 6300, 1),
(394, 6301, 1),
(395, 6302, 1),
(396, 6303, 1),
(398, 6305, 1),
(399, 6306, 1),
(400, 6307, 1),
(401, 6308, 1),
(402, 6309, 1),
(403, 6310, 1),
(404, 6311, 1),
(405, 6312, 1),
(406, 6313, 1),
(407, 6314, 1),
(408, 6315, 1),
(409, 6316, 1),
(410, 6317, 1),
(411, 6318, 1),
(412, 6319, 1),
(413, 6320, 1),
(414, 6321, 1),
(415, 6322, 1),
(416, 6323, 1),
(417, 6324, 1),
(418, 6325, 1),
(419, 6326, 1),
(420, 6327, 1),
(421, 6328, 1),
(422, 6329, 1),
(423, 6330, 1),
(424, 6331, 1),
(425, 6332, 1),
(426, 6333, 1),
(428, 6335, 1),
(429, 6336, 1),
(431, 6338, 1),
(432, 6339, 1),
(433, 6340, 1),
(434, 6341, 1),
(435, 6342, 1),
(436, 6343, 1),
(437, 6344, 1),
(438, 6345, 1),
(439, 6346, 1),
(440, 6347, 1),
(441, 6348, 1),
(443, 6350, 1),
(445, 6352, 1),
(446, 6353, 1),
(447, 6354, 1),
(448, 6355, 1),
(449, 6356, 1),
(450, 6357, 1),
(451, 6358, 1),
(452, 6359, 1),
(453, 6360, 1),
(454, 6361, 1),
(455, 6362, 1),
(456, 6363, 1),
(457, 6364, 1),
(458, 6365, 1),
(459, 6366, 1),
(460, 6367, 1),
(461, 6368, 1),
(463, 6370, 1),
(464, 6371, 1),
(465, 6372, 1),
(466, 6373, 1),
(467, 6374, 1),
(468, 6375, 1),
(469, 6376, 1),
(470, 6377, 1),
(471, 6378, 1),
(472, 6379, 1),
(473, 6380, 1),
(474, 6381, 1),
(476, 6383, 1),
(477, 6384, 1),
(478, 6385, 1),
(479, 6386, 1),
(480, 6387, 1),
(481, 6388, 1),
(482, 6389, 1),
(483, 6390, 1),
(484, 6391, 1),
(485, 6392, 1),
(486, 6393, 1),
(487, 6394, 1),
(488, 6395, 1),
(489, 6396, 1),
(490, 6397, 1),
(491, 6398, 1),
(492, 6399, 1),
(493, 6400, 1),
(494, 6401, 1),
(495, 6402, 1),
(497, 6404, 1),
(498, 6405, 1),
(499, 6406, 1),
(500, 6407, 1),
(501, 6408, 1),
(502, 6409, 1),
(503, 6410, 1),
(504, 6411, 1),
(505, 6412, 1),
(506, 6413, 1),
(507, 6414, 1),
(508, 6415, 1),
(509, 6416, 1),
(510, 6417, 1),
(511, 6418, 1),
(513, 6420, 1),
(514, 6421, 1),
(515, 6422, 1),
(516, 6423, 1),
(517, 6424, 1),
(518, 6425, 1),
(519, 6426, 1),
(520, 6427, 1),
(521, 6428, 1),
(522, 6429, 1),
(523, 6430, 1),
(524, 6431, 1),
(525, 6432, 1),
(526, 6433, 1),
(527, 6434, 1),
(528, 6435, 1),
(529, 6436, 1),
(530, 6437, 1),
(531, 6438, 1),
(532, 6439, 1),
(534, 6441, 1),
(535, 6442, 1),
(537, 6444, 1),
(538, 6445, 1),
(539, 6446, 1),
(540, 6447, 1),
(541, 6448, 1),
(542, 6449, 1),
(543, 6450, 1),
(544, 6451, 1),
(545, 6452, 1),
(546, 6453, 1),
(547, 6454, 1),
(548, 6455, 1),
(549, 6456, 1),
(550, 6457, 1),
(551, 6458, 1),
(552, 6459, 1),
(553, 6460, 1),
(554, 6461, 1),
(555, 6462, 1),
(556, 6463, 1),
(557, 6464, 1),
(558, 6465, 1),
(559, 6466, 1),
(560, 6467, 1),
(561, 6468, 1),
(562, 6469, 1),
(563, 6470, 1),
(564, 6471, 1),
(565, 6472, 1),
(566, 6473, 1),
(567, 6474, 1),
(568, 6475, 1),
(569, 6476, 1),
(570, 6477, 1),
(571, 6478, 1),
(572, 6479, 1),
(573, 6480, 1),
(574, 6481, 1),
(575, 6482, 1),
(576, 6483, 1),
(577, 6484, 1),
(578, 6485, 1),
(579, 6486, 1),
(580, 6487, 1),
(581, 6488, 1),
(584, 6489, 1),
(585, 6490, 1),
(586, 6491, 1),
(587, 6492, 1),
(588, 6493, 1),
(590, 6495, 1),
(592, 6497, 1),
(593, 6498, 1),
(595, 6500, 1),
(596, 6501, 1),
(597, 6502, 1),
(598, 6503, 1),
(599, 6504, 1),
(600, 6505, 1),
(601, 6506, 1),
(602, 6507, 1),
(604, 6509, 1),
(605, 6510, 1),
(606, 6511, 1),
(607, 6512, 1),
(608, 6513, 1),
(609, 6514, 1),
(610, 6515, 1),
(611, 6516, 1),
(612, 6517, 1),
(613, 6518, 1),
(614, 6519, 1),
(616, 6521, 1),
(617, 6522, 1),
(618, 6523, 1),
(619, 6524, 1),
(621, 6525, 1),
(96, 7006, 1),
(109, 7007, 1),
(147, 7018, 1),
(154, 7019, 1),
(165, 7020, 1),
(211, 7022, 1),
(218, 7023, 1),
(225, 7025, 1),
(235, 7026, 1),
(277, 7027, 1),
(310, 7030, 1),
(340, 7031, 1),
(358, 7034, 1),
(367, 7036, 1),
(375, 7037, 1),
(397, 7038, 1),
(427, 7039, 1),
(442, 7040, 1),
(444, 7041, 1),
(462, 7042, 1),
(475, 7043, 1),
(496, 7044, 1),
(512, 7047, 1),
(533, 7049, 1),
(536, 7050, 1),
(589, 7055, 1),
(591, 7056, 1),
(594, 7057, 1),
(603, 7058, 1),
(615, 7061, 1),
(623, 7064, 1),
(3442, 7069, 1),
(4456, 7078, 1),
(4951, 7080, 1),
(4952, 6567, 1),
(4953, 6568, 1),
(4954, 6569, 1),
(4956, 6571, 1),
(4957, 6572, 1),
(4958, 6573, 1),
(4959, 6574, 1),
(4960, 6575, 1),
(4961, 6576, 1),
(4962, 7082, 1),
(4963, 7083, 1),
(4964, 6579, 1),
(4965, 6580, 1),
(4966, 6581, 1),
(4968, 6583, 1),
(4969, 6584, 1),
(4970, 6585, 1),
(4971, 6586, 1),
(4972, 6587, 1),
(4973, 6588, 1),
(4974, 6589, 1),
(4975, 6590, 1),
(4976, 6591, 1),
(4979, 6594, 1),
(4983, 6596, 1),
(4984, 6746, 1);
-- (88, 7002, 4),
-- (94, 7004, 4),
-- (96, 6043, 4),
-- (109, 6056, 4),
-- (111, 7008, 4),
-- (112, 7010, 4),
-- (122, 7012, 4),
-- (123, 7013, 4),
-- (125, 7015, 4),
-- (142, 7016, 4),
-- (147, 6094, 4),
-- (151, 6098, 4),
-- (154, 6101, 4),
-- (165, 6112, 4),
-- (211, 6123, 4),
-- (218, 6130, 4),
-- (221, 7024, 4),
-- (225, 6135, 4),
-- (235, 6145, 4),
-- (277, 6187, 4),
-- (279, 7028, 4),
-- (310, 6218, 4),
-- (340, 6248, 4),
-- (357, 7032, 4),
-- (358, 6265, 4),
-- (363, 7035, 4),
-- (367, 6274, 4),
-- (375, 6282, 4),
-- (397, 6304, 4),
-- (427, 6334, 4),
-- (430, 6337, 4),
-- (442, 6349, 4),
-- (444, 6351, 4),
-- (462, 6369, 4),
-- (475, 6382, 4),
-- (496, 6403, 4),
-- (507, 7045, 4),
-- (512, 6419, 4),
-- (513, 7048, 4),
-- (533, 6440, 4),
-- (536, 6443, 4),
-- (551, 7051, 4),
-- (581, 7053, 4),
-- (589, 6494, 4),
-- (591, 6496, 4),
-- (594, 6499, 4),
-- (603, 6508, 4),
-- (609, 7059, 4),
-- (615, 6520, 4),
-- (616, 7062, 4),
-- (618, 7063, 4),
-- (623, 6526, 4),
-- (1434, 6527, 4),
-- (2434, 7065, 4),
-- (2435, 6529, 4),
-- (2436, 7066, 4),
-- (2437, 7067, 4),
-- (2438, 6532, 4),
-- (2439, 6533, 4),
-- (3436, 6534, 4),
-- (3438, 6535, 4),
-- (3439, 6536, 4),
-- (3440, 6537, 4),
-- (3441, 6538, 4),
-- (3442, 6539, 4),
-- (3443, 6540, 4),
-- (3444, 6541, 4),
-- (3445, 6542, 4),
-- (3446, 6543, 4),
-- (3447, 6544, 4),
-- (3448, 7070, 4),
-- (3449, 7071, 4),
-- (4438, 7072, 4),
-- (4439, 6548, 4),
-- (4441, 7073, 4),
-- (4443, 6550, 4),
-- (4444, 7074, 4),
-- (4445, 7075, 4),
-- (4446, 7076, 4),
-- (4447, 6554, 4),
-- (4449, 6555, 4),
-- (4450, 6556, 4),
-- (4451, 6557, 4),
-- (4452, 6558, 4),
-- (4453, 6559, 4),
-- (4454, 6560, 4),
-- (4455, 6561, 4),
-- (4456, 6562, 4),
-- (4457, 6563, 4),
-- (4458, 7079, 4),
-- (4460, 6565, 4),
-- (4951, 6566, 4),
-- (4955, 7081, 4),
-- (4962, 6577, 4),
-- (4963, 6578, 4),
-- (4966, 7084, 4),
-- (4967, 6582, 4),
-- (4977, 6592, 4),
-- (4978, 6593, 4),
-- (4984, 6598, 4);

-- Update Discipline table
UPDATE d WITH (ROWLOCK, UPDLOCK)
SET d.EmployeeId = m.NewEmpId,
    d.CreatedBy = CASE 
        WHEN d.CreatedBy IN (SELECT OldEmpId FROM #EmpIdMapping) 
        THEN (SELECT NewEmpId FROM #EmpIdMapping WHERE OldEmpId = d.CreatedBy)
        ELSE d.CreatedBy
    END,
    d.ModifiedBy = CASE 
        WHEN d.ModifiedBy IN (SELECT OldEmpId FROM #EmpIdMapping) 
        THEN (SELECT NewEmpId FROM #EmpIdMapping WHERE OldEmpId = d.ModifiedBy)
        ELSE d.ModifiedBy
    END
FROM [dbo].[Discipline] d
INNER JOIN #EmpIdMapping m ON d.EmployeeId = m.OldEmpId;

-- Update Employee table
UPDATE e WITH (ROWLOCK, UPDLOCK)
SET e.EmployeeId = m.NewEmpId
FROM [dbo].[Employee] e
INNER JOIN #EmpIdMapping m ON e.EmployeeId = m.OldEmpId;

-- Update EmployeeFlowSetting table
UPDATE efs WITH (ROWLOCK, UPDLOCK)
SET efs.EmployeeId = m.NewEmpId,
    efs.EvaluatorId = CASE 
        WHEN efs.EvaluatorId IN (SELECT OldEmpId FROM #EmpIdMapping) 
        THEN (SELECT NewEmpId FROM #EmpIdMapping WHERE OldEmpId = efs.EvaluatorId)
        ELSE efs.EvaluatorId
    END
FROM [dbo].[EmployeeFlowSetting] efs
INNER JOIN #EmpIdMapping m ON efs.EmployeeId = m.OldEmpId;

-- Update EmployeeOvertime table
UPDATE eo WITH (ROWLOCK, UPDLOCK)
SET eo.EmployeeId = m.NewEmpId
FROM [dbo].[EmployeeOvertime] eo
INNER JOIN #EmpIdMapping m ON eo.EmployeeId = m.OldEmpId;
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM dbo.EmployeeOvertime eo2
--     WHERE eo2.EmployeeId = m.NewEmpId
--       AND eo2.OvertimeId = eo.OvertimeId
-- );

-- Update EmployeeObjective table
UPDATE eo WITH (ROWLOCK, UPDLOCK)
SET eo.EmployeeId = m.NewEmpId
FROM [dbo].[EmployeeObjective] eo
INNER JOIN #EmpIdMapping m ON eo.EmployeeId = m.OldEmpId;

-- Update EmployeeRole table
UPDATE er WITH (ROWLOCK, UPDLOCK)
SET er.EmployeeId = m.NewEmpId
FROM [dbo].[EmployeeRole] er
INNER JOIN #EmpIdMapping m ON er.EmployeeId = m.OldEmpId;

-- Update Notification table
UPDATE n WITH (ROWLOCK, UPDLOCK)
SET n.CreatorId = CASE 
        WHEN n.CreatorId IN (SELECT OldEmpId FROM #EmpIdMapping) 
        THEN (SELECT NewEmpId FROM #EmpIdMapping WHERE OldEmpId = n.CreatorId)
        ELSE n.CreatorId
    END,
    n.EmployeeId = m.NewEmpId
FROM [dbo].[Notification] n
INNER JOIN #EmpIdMapping m ON n.EmployeeId = m.OldEmpId;

-- Update NotificationSetting table
UPDATE ns WITH (ROWLOCK, UPDLOCK)
SET ns.EmployeeId = m.NewEmpId
FROM [dbo].[NotificationSetting] ns
INNER JOIN #EmpIdMapping m ON ns.EmployeeId = m.OldEmpId;

-- Update PAFocus table
UPDATE pf WITH (ROWLOCK, UPDLOCK)
SET pf.EmployeeId = m.NewEmpId,
    pf.ModifiedBy = CASE 
        WHEN pf.ModifiedBy IN (SELECT OldEmpId FROM #EmpIdMapping) 
        THEN (SELECT NewEmpId FROM #EmpIdMapping WHERE OldEmpId = pf.ModifiedBy)
        ELSE pf.ModifiedBy
    END
FROM [dbo].[PAFocus] pf
INNER JOIN #EmpIdMapping m ON pf.EmployeeId = m.OldEmpId;

-- Update PARecord table
UPDATE pr WITH (ROWLOCK, UPDLOCK)
SET pr.EmployeeId = m.NewEmpId,
    pr.ModifiedBy = CASE 
        WHEN pr.ModifiedBy IN (SELECT OldEmpId FROM #EmpIdMapping) 
        THEN (SELECT NewEmpId FROM #EmpIdMapping WHERE OldEmpId = pr.ModifiedBy)
        ELSE pr.ModifiedBy
    END
FROM [dbo].[PARecord] pr
INNER JOIN #EmpIdMapping m ON pr.EmployeeId = m.OldEmpId;

-- Update PerformanceRecord table
UPDATE perf WITH (ROWLOCK, UPDLOCK)
SET perf.EmployeeId = m.NewEmpId,
    perf.CreatorId = CASE 
        WHEN perf.CreatorId IN (SELECT OldEmpId FROM #EmpIdMapping) 
        THEN (SELECT NewEmpId FROM #EmpIdMapping WHERE OldEmpId = perf.CreatorId)
        ELSE perf.CreatorId
    END
FROM [dbo].[PerformanceRecord] perf
INNER JOIN #EmpIdMapping m ON perf.EmployeeId = m.OldEmpId;

-- Update ProbationEvaluation table
UPDATE pe WITH (ROWLOCK, UPDLOCK)
SET pe.EmployeeId = m.NewEmpId
FROM [dbo].[ProbationEvaluation] pe
INNER JOIN #EmpIdMapping m ON pe.EmployeeId = m.OldEmpId;

-- Update ProbationEvaluationDetail table
UPDATE ped WITH (ROWLOCK, UPDLOCK)  
SET ped.EmployeeId = m.NewEmpId
FROM [dbo].[ProbationEvaluationDetail] ped
INNER JOIN #EmpIdMapping m ON ped.EmployeeId = m.OldEmpId;

-- Update ProbationSetting table
UPDATE ps WITH (ROWLOCK, UPDLOCK)
SET ps.EmployeeId = m.NewEmpId,
    ps.EvaluatorId = CASE 
        WHEN ps.EvaluatorId IN (SELECT OldEmpId FROM #EmpIdMapping) 
        THEN (SELECT NewEmpId FROM #EmpIdMapping WHERE OldEmpId = ps.EvaluatorId)
        ELSE ps.EvaluatorId
    END
FROM [dbo].[ProbationSetting] ps
INNER JOIN #EmpIdMapping m ON ps.EmployeeId = m.OldEmpId;

-- Update EmployeeAttendance table
UPDATE ea WITH (ROWLOCK, UPDLOCK)
SET ea.EmpId = m.NewEmpId,
    ea.SyncDate = GETDATE()
FROM [dbo].[EmployeeAttendance] ea
INNER JOIN #EmpIdMapping m ON ea.EmpId = m.OldEmpId;

-- Update EmployeeCalendar table
UPDATE ec WITH (ROWLOCK, UPDLOCK)
SET ec.EmpId = m.NewEmpId
FROM [dbo].[EmployeeCalendar] ec
INNER JOIN #EmpIdMapping m ON ec.EmpId = m.OldEmpId;

-- Update TOEIC table
UPDATE t WITH (ROWLOCK, UPDLOCK)
SET t.EmpId = m.NewEmpId
FROM [dbo].[TOEIC] t
INNER JOIN #EmpIdMapping m ON t.EmpId = m.OldEmpId;

-- Update WorkingTimeRequest table
UPDATE wtr WITH (ROWLOCK, UPDLOCK)
SET wtr.EmpId = m.NewEmpId
FROM [dbo].[WorkingTimeRequest] wtr
INNER JOIN #EmpIdMapping m ON wtr.EmpId = m.OldEmpId;

-- Clean up temporary table
DROP TABLE #EmpIdMapping;
