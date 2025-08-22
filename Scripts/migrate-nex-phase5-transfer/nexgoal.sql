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
(86, 6008, 1),
(87, 6009, 1),
(88, 6010, 1),
(89, 6011, 1),
(90, 6012, 1),
(91, 6013, 1),
(92, 6014, 1),
(93, 6015, 1),
(94, 6016, 1),
(95, 6017, 1),
(97, 6019, 1),
(98, 6020, 1),
(99, 6021, 1),
(100, 6022, 1),
(101, 6023, 1),
(102, 6024, 1),
(103, 6025, 1),
(104, 6026, 1),
(105, 6027, 1),
(106, 6028, 1),
(107, 6029, 1),
(108, 6030, 1),
(110, 6032, 1),
(111, 6033, 1),
(112, 6034, 1),
(113, 6035, 1),
(114, 6036, 1),
(115, 6037, 1),
(116, 6038, 1),
(117, 6039, 1),
(118, 6040, 1),
(119, 6041, 1),
(120, 6042, 1),
(121, 6043, 1),
(122, 6044, 1),
(123, 6045, 1),
(124, 6046, 1),
(125, 6047, 1),
(126, 6048, 1),
(127, 6049, 1),
(128, 6050, 1),
(129, 6051, 1),
(130, 6052, 1),
(131, 6053, 1),
(132, 6054, 1),
(133, 6055, 1),
(134, 6056, 1),
(135, 6057, 1),
(136, 6058, 1),
(137, 6059, 1),
(138, 6060, 1),
(139, 6061, 1),
(140, 6062, 1),
(141, 6063, 1),
(142, 6064, 1),
(143, 6065, 1),
(144, 6066, 1),
(145, 6067, 1),
(146, 6068, 1),
(148, 6070, 1),
(149, 6071, 1),
(150, 6072, 1),
(152, 6074, 1),
(153, 6075, 1),
(155, 6077, 1),
(156, 6078, 1),
(157, 6079, 1),
(158, 6080, 1),
(159, 6081, 1),
(160, 6082, 1),
(161, 6083, 1),
(162, 6084, 1),
(163, 6085, 1),
(164, 6086, 1),
(166, 6088, 1),
(167, 6089, 1),
(168, 6090, 1),
(169, 6091, 1),
(170, 6092, 1),
(200, 6093, 1),
(204, 6094, 1),
(205, 6095, 1),
(206, 6096, 1),
(210, 6097, 1),
(212, 6099, 1),
(213, 6100, 1),
(214, 6101, 1),
(215, 6102, 1),
(216, 6103, 1),
(217, 6104, 1),
(221, 6106, 1),
(222, 6107, 1),
(223, 6108, 1),
(224, 6109, 1),
(226, 6111, 1),
(227, 6112, 1),
(228, 6113, 1),
(229, 6114, 1),
(230, 6115, 1),
(231, 6116, 1),
(232, 6117, 1),
(233, 6118, 1),
(234, 6119, 1),
(236, 6121, 1),
(237, 6122, 1),
(238, 6123, 1),
(239, 6124, 1),
(240, 6125, 1),
(241, 6126, 1),
(242, 6127, 1),
(243, 6128, 1),
(244, 6129, 1),
(245, 6130, 1),
(246, 6131, 1),
(247, 6132, 1),
(248, 6133, 1),
(249, 6134, 1),
(250, 6135, 1),
(251, 6136, 1),
(252, 6137, 1),
(253, 6138, 1),
(254, 6139, 1),
(255, 6140, 1),
(256, 6141, 1),
(257, 6142, 1),
(258, 6143, 1),
(259, 6144, 1),
(260, 6145, 1),
(261, 6146, 1),
(262, 6147, 1),
(263, 6148, 1),
(264, 6149, 1),
(265, 6150, 1),
(266, 6151, 1),
(267, 6152, 1),
(268, 6153, 1),
(269, 6154, 1),
(270, 6155, 1),
(271, 6156, 1),
(272, 6157, 1),
(273, 6158, 1),
(274, 6159, 1),
(275, 6160, 1),
(276, 6161, 1),
(278, 6163, 1),
(279, 6164, 1),
(280, 6165, 1),
(281, 6166, 1),
(282, 6167, 1),
(283, 6168, 1),
(284, 6169, 1),
(285, 6170, 1),
(286, 6171, 1),
(287, 6172, 1),
(289, 6173, 1),
(290, 6174, 1),
(291, 6175, 1),
(292, 6176, 1),
(293, 6177, 1),
(295, 6178, 1),
(296, 6179, 1),
(297, 6180, 1),
(298, 6181, 1),
(299, 6182, 1),
(300, 6183, 1),
(301, 6184, 1),
(302, 6185, 1),
(303, 6186, 1),
(304, 6187, 1),
(305, 6188, 1),
(306, 6189, 1),
(307, 6190, 1),
(308, 6191, 1),
(309, 6192, 1),
(311, 6194, 1),
(312, 6195, 1),
(313, 6196, 1),
(314, 6197, 1),
(315, 6198, 1),
(316, 6199, 1),
(317, 6200, 1),
(318, 6201, 1),
(319, 6202, 1),
(320, 6203, 1),
(321, 6204, 1),
(322, 6205, 1),
(323, 6206, 1),
(324, 6207, 1),
(325, 6208, 1),
(326, 6209, 1),
(327, 6210, 1),
(328, 6211, 1),
(329, 6212, 1),
(330, 6213, 1),
(331, 6214, 1),
(332, 6215, 1),
(333, 6216, 1),
(334, 6217, 1),
(335, 6218, 1),
(336, 6219, 1),
(337, 6220, 1),
(338, 6221, 1),
(339, 6222, 1),
(341, 6224, 1),
(342, 6225, 1),
(343, 6226, 1),
(344, 6227, 1),
(345, 6228, 1),
(347, 6229, 1),
(348, 6230, 1),
(349, 6231, 1),
(350, 6232, 1),
(351, 6233, 1),
(352, 6234, 1),
(353, 6235, 1),
(354, 6236, 1),
(355, 6237, 1),
(356, 6238, 1),
(357, 6239, 1),
(359, 6241, 1),
(360, 6242, 1),
(361, 6243, 1),
(362, 6244, 1),
(363, 6245, 1),
(364, 6246, 1),
(365, 6247, 1),
(366, 6248, 1),
(368, 6250, 1),
(369, 6251, 1),
(370, 6252, 1),
(371, 6253, 1),
(372, 6254, 1),
(373, 6255, 1),
(374, 6256, 1),
(376, 6258, 1),
(377, 6259, 1),
(378, 6260, 1),
(379, 6261, 1),
(380, 6262, 1),
(381, 6263, 1),
(382, 6264, 1),
(383, 6265, 1),
(384, 6266, 1),
(385, 6267, 1),
(386, 6268, 1),
(387, 6269, 1),
(388, 6270, 1),
(389, 6271, 1),
(390, 6272, 1),
(391, 6273, 1),
(392, 6274, 1),
(393, 6275, 1),
(394, 6276, 1),
(395, 6277, 1),
(396, 6278, 1),
(398, 6280, 1),
(399, 6281, 1),
(400, 6282, 1),
(401, 6283, 1),
(402, 6284, 1),
(403, 6285, 1),
(404, 6286, 1),
(405, 6287, 1),
(406, 6288, 1),
(407, 6289, 1),
(408, 6290, 1),
(409, 6291, 1),
(410, 6292, 1),
(411, 6293, 1),
(412, 6294, 1),
(413, 6295, 1),
(414, 6296, 1),
(415, 6297, 1),
(416, 6298, 1),
(417, 6299, 1),
(418, 6300, 1),
(419, 6301, 1),
(420, 6302, 1),
(421, 6303, 1),
(422, 6304, 1),
(423, 6305, 1),
(424, 6306, 1),
(425, 6307, 1),
(426, 6308, 1),
(428, 6310, 1),
(429, 6311, 1),
(431, 6313, 1),
(432, 6314, 1),
(433, 6315, 1),
(434, 6316, 1),
(435, 6317, 1),
(436, 6318, 1),
(437, 6319, 1),
(438, 6320, 1),
(439, 6321, 1),
(440, 6322, 1),
(441, 6323, 1),
(443, 6325, 1),
(445, 6327, 1),
(446, 6328, 1),
(447, 6329, 1),
(448, 6330, 1),
(449, 6331, 1),
(450, 6332, 1),
(451, 6333, 1),
(452, 6334, 1),
(453, 6335, 1),
(454, 6336, 1),
(455, 6337, 1),
(456, 6338, 1),
(457, 6339, 1),
(458, 6340, 1),
(459, 6341, 1),
(460, 6342, 1),
(461, 6343, 1),
(463, 6345, 1),
(464, 6346, 1),
(465, 6347, 1),
(466, 6348, 1),
(467, 6349, 1),
(468, 6350, 1),
(469, 6351, 1),
(470, 6352, 1),
(471, 6353, 1),
(472, 6354, 1),
(473, 6355, 1),
(474, 6356, 1),
(476, 6358, 1),
(477, 6359, 1),
(478, 6360, 1),
(479, 6361, 1),
(480, 6362, 1),
(481, 6363, 1),
(482, 6364, 1),
(483, 6365, 1),
(484, 6366, 1),
(485, 6367, 1),
(486, 6368, 1),
(487, 6369, 1),
(488, 6370, 1),
(489, 6371, 1),
(490, 6372, 1),
(491, 6373, 1),
(492, 6374, 1),
(493, 6375, 1),
(494, 6376, 1),
(495, 6377, 1),
(497, 6379, 1),
(498, 6380, 1),
(499, 6381, 1),
(500, 6382, 1),
(501, 6383, 1),
(502, 6384, 1),
(503, 6385, 1),
(504, 6386, 1),
(505, 6387, 1),
(506, 6388, 1),
(507, 6389, 1),
(508, 6390, 1),
(509, 6391, 1),
(510, 6392, 1),
(511, 6393, 1),
(514, 6396, 1),
(515, 6397, 1),
(516, 6398, 1),
(517, 6399, 1),
(518, 6400, 1),
(519, 6401, 1),
(520, 6402, 1),
(521, 6403, 1),
(522, 6404, 1),
(523, 6405, 1),
(524, 6406, 1),
(525, 6407, 1),
(526, 6408, 1),
(527, 6409, 1),
(528, 6410, 1),
(529, 6411, 1),
(530, 6412, 1),
(531, 6413, 1),
(532, 6414, 1),
(534, 6416, 1),
(535, 6417, 1),
(537, 6419, 1),
(538, 6420, 1),
(539, 6421, 1),
(540, 6422, 1),
(541, 6423, 1),
(542, 6424, 1),
(543, 6425, 1),
(544, 6426, 1),
(545, 6427, 1),
(546, 6428, 1),
(547, 6429, 1),
(548, 6430, 1),
(549, 6431, 1),
(550, 6432, 1),
(551, 6433, 1),
(552, 6434, 1),
(553, 6435, 1),
(554, 6436, 1),
(555, 6437, 1),
(556, 6438, 1),
(557, 6439, 1),
(558, 6440, 1),
(559, 6441, 1),
(560, 6442, 1),
(561, 6443, 1),
(562, 6444, 1),
(563, 6445, 1),
(564, 6446, 1),
(565, 6447, 1),
(566, 6448, 1),
(567, 6449, 1),
(568, 6450, 1),
(569, 6451, 1),
(570, 6452, 1),
(571, 6453, 1),
(572, 6454, 1),
(573, 6455, 1),
(574, 6456, 1),
(575, 6457, 1),
(576, 6458, 1),
(577, 6459, 1),
(578, 6460, 1),
(579, 6461, 1),
(580, 6462, 1),
(581, 6463, 1),
(584, 6464, 1),
(585, 6465, 1),
(586, 6466, 1),
(587, 6467, 1),
(588, 6468, 1),
(590, 6470, 1),
(592, 6472, 1),
(593, 6473, 1),
(595, 6475, 1),
(596, 6476, 1),
(597, 6477, 1),
(598, 6478, 1),
(599, 6479, 1),
(600, 6480, 1),
(601, 6481, 1),
(602, 6482, 1),
(604, 6484, 1),
(605, 6485, 1),
(606, 6486, 1),
(607, 6487, 1),
(608, 6488, 1),
(609, 6489, 1),
(610, 6490, 1),
(611, 6491, 1),
(612, 6492, 1),
(613, 6493, 1),
(614, 6494, 1),
(615, 6495, 1),
(616, 6496, 1),
(617, 6497, 1),
(618, 6498, 1),
(619, 6499, 1),
(621, 6500, 1),
(4952, 6542, 1),
(4953, 6543, 1),
(4954, 6544, 1),
(4956, 6546, 1),
(4957, 6547, 1),
(4958, 6548, 1),
(4959, 6549, 1),
(4960, 6550, 1),
(4961, 6551, 1),
(4964, 6554, 1),
(4965, 6555, 1),
(4966, 6556, 1),
(4968, 6558, 1),
(4969, 6559, 1),
(4970, 6560, 1),
(4971, 6561, 1),
(4972, 6562, 1),
(4973, 6563, 1),
(4974, 6564, 1),
(4975, 6565, 1),
(4976, 6566, 1),
(4979, 6569, 1),
(96, 8005, 1),
(109, 8006, 1),
(147, 8015, 1),
(154, 8016, 1),
(165, 8017, 1),
(211, 8019, 1),
(218, 8020, 1),
(225, 8022, 1),
(235, 8023, 1),
(277, 8025, 1),
(310, 8029, 1),
(340, 8030, 1),
(358, 8033, 1),
(367, 8035, 1),
(375, 8036, 1),
(397, 8037, 1),
(427, 8038, 1),
(442, 8039, 1),
(444, 8040, 1),
(462, 8041, 1),
(475, 8042, 1),
(496, 8043, 1),
(512, 8046, 1),
(513, 8047, 1),
(533, 8048, 1),
(536, 8049, 1),
(589, 8054, 1),
(591, 8055, 1),
(594, 8056, 1),
(603, 8057, 1),
(623, 8063, 1),
(3442, 8064, 1),
(4456, 8065, 1),
(4951, 8066, 1),
(4962, 8067, 1),
(4963, 8068, 1);
-- (96, 6018, 4),
-- (109, 6031, 4),
-- (147, 6069, 4),
-- (151, 6073, 4),
-- (154, 6076, 4),
-- (165, 6087, 4),
-- (211, 6098, 4),
-- (218, 6105, 4),
-- (225, 6110, 4),
-- (235, 6120, 4),
-- (277, 6162, 4),
-- (310, 6193, 4),
-- (340, 6223, 4),
-- (358, 6240, 4),
-- (367, 6249, 4),
-- (375, 6257, 4),
-- (397, 6279, 4),
-- (427, 6309, 4),
-- (430, 6312, 4),
-- (442, 6324, 4),
-- (444, 6326, 4),
-- (462, 6344, 4),
-- (475, 6357, 4),
-- (496, 6378, 4),
-- (512, 6394, 4),
-- (513, 6395, 4),
-- (533, 6415, 4),
-- (536, 6418, 4),
-- (589, 6469, 4),
-- (591, 6471, 4),
-- (594, 6474, 4),
-- (603, 6483, 4),
-- (623, 6501, 4),
-- (1434, 6502, 4),
-- (2435, 6504, 4),
-- (2439, 6508, 4),
-- (3436, 6509, 4),
-- (3438, 6510, 4),
-- (3439, 6511, 4),
-- (3440, 6512, 4),
-- (3441, 6513, 4),
-- (3442, 6514, 4),
-- (3443, 6515, 4),
-- (3444, 6516, 4),
-- (3445, 6517, 4),
-- (3446, 6518, 4),
-- (3447, 6519, 4),
-- (4439, 6523, 4),
-- (4443, 6525, 4),
-- (4449, 6530, 4),
-- (4450, 6531, 4),
-- (4451, 6532, 4),
-- (4452, 6533, 4),
-- (4453, 6534, 4),
-- (4454, 6535, 4),
-- (4455, 6536, 4),
-- (4456, 6537, 4),
-- (4457, 6538, 4),
-- (4460, 6540, 4),
-- (4951, 6541, 4),
-- (4962, 6552, 4),
-- (4963, 6553, 4),
-- (4967, 6557, 4),
-- (4977, 6567, 4),
-- (4978, 6568, 4),
-- (88, 8002, 4),
-- (112, 8007, 4),
-- (122, 8009, 4),
-- (123, 8010, 4),
-- (125, 8012, 4),
-- (142, 8013, 4),
-- (221, 8021, 4),
-- (244, 8024, 4),
-- (279, 8026, 4),
-- (285, 8028, 4),
-- (357, 8031, 4),
-- (363, 8034, 4),
-- (507, 8044, 4),
-- (551, 8050, 4),
-- (581, 8052, 4),
-- (609, 8058, 4),
-- (615, 8060, 4),
-- (616, 8061, 4),
-- (618, 8062, 4),
-- (4966, 8069, 4);

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
