Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D4815A2F7
	for <lists+kernel-janitors@lfdr.de>; Wed, 12 Feb 2020 09:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgBLINI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 12 Feb 2020 03:13:08 -0500
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:51100 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728287AbgBLINH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Feb 2020 03:13:07 -0500
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01C89res027371
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2020 00:13:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfpt0818;
 bh=h6/x1Wt79Oj5OBnXKXMii5dbswwhNUy/3/lF3bTGrVY=;
 b=UldMONmWOaaKOBfwtMc3Mp9U5WvaUgnUqoKGSimUGqNurSAcHM8eq0QuSrq57oNi5mWz
 51nqTZj/Qcg3hOb628o1DqUprbqq45EBbVN3/F2TjatAk8z4i8lvlJ7sNCOO4afiB4Og
 CsMz+WpIZTwgdfUgHj972ivRGJ4eX68Fpdqir5VnU8UcaQU6i9U4XQ28mRV7VibR/uoE
 YTvmZTQ7nMJz8I1RHaOAYDdOIgsDVm/P0Jc5Q8Cbqdp8KnBROtTERANZb7dWzCS3UF3H
 sBBg1IdtPnj2e+NQucokYYy/U7DTpFuCyd1tmExnPVeAMXQEFKzWtJtpiDlzQbgj3NPu hQ== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
        by mx0a-0016f401.pphosted.com with ESMTP id 2y4be28hjr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2020 00:13:06 -0800
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 Feb
 2020 00:13:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by SC-EXCH02.marvell.com (10.93.176.82) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 12 Feb 2020 00:13:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwtwJztC1rXv+UAS1bD9Rx64JNw46BwIcSYx3/eMId+vpUthlRpYJnFydcVlATuYFWZJ6s5OEwwFEQQ7tSy1e5FJ5PzPUTWo9h1BPzs6ZmWSv95zhz1LbXrZ1UrJsOwwagd1Gwz0pDPdqvMdBnM363H0WWm5ztGi6Hfq3dT3zDYhl0DHFuOrJ5iwU6o+/zYQPTA4JV8//5CvoDThPBG+Eyg4HeoAvqK4f4OedM3xakk223nTNXnH+mEQX+xGodp6w+SAIKQiQNpEbMa3jgJJ3m04Ju0g2+gkkQT3xxkiIzwDfEeZCE0BHOFm5TVAw5745lh8dbuPAL77xu2MUXtr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6/x1Wt79Oj5OBnXKXMii5dbswwhNUy/3/lF3bTGrVY=;
 b=n49Prw5tiGbbDof+yD0GlsIi0cpAE5UQCUFXR80JuysParu0UWJ9HBKdECddflT5G8VtYL6z6UZqlJnN2cM+hH54+m9AY1Dc/co18yPTDvZqbm6pAqDzWzZ7svobzyq5jkS+iBxsUg6yWrS3z/Wi+5aT8Fr49ayN4kCpJvK1sfM9ygTbOWkiOXrBhEGzjjNOBlk7CYI52BbDx2ZyrPfxRUWplaveUZ5WunEv1MfJqhJIQul57aEr8ZEJQP/ejl1Wxru13YtIziXzoaXWoPB6fSXH3dBj7qKsXPrsvxcXa6O/K0vsF6X6UkhRZCQTFg7vTwbhk3T00vCGS9vL126LYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6/x1Wt79Oj5OBnXKXMii5dbswwhNUy/3/lF3bTGrVY=;
 b=pNd104pZ1oQPs5BCtisRjq9qUJqF2SJq+WnjyGT9KK6vQocT4sZSFrLkcrGu+dP1dVWCerlFUrn8akCpDxaQaUxHJ0rTaTwP/0zcXAIxvY1Y0A65SPQWnBe5nyVD/LA6mJYt3rAO3CXQUmtspJIpH2TlNKsof8O4qVZvgw2QZIo=
Received: from BYAPR18MB2357.namprd18.prod.outlook.com (20.179.92.75) by
 BYAPR18MB2376.namprd18.prod.outlook.com (20.179.92.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Wed, 12 Feb 2020 08:13:02 +0000
Received: from BYAPR18MB2357.namprd18.prod.outlook.com
 ([fe80::9020:d538:f17f:1b55]) by BYAPR18MB2357.namprd18.prod.outlook.com
 ([fe80::9020:d538:f17f:1b55%5]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 08:13:02 +0000
From:   Dmitry Bogdanov <dbogdanov@marvell.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Igor Russkikh" <irusskikh@marvell.com>
Subject: RE: [EXT] [bug report] net: aquantia: add support of rx-vlan-filter
 offload
Thread-Topic: [EXT] [bug report] net: aquantia: add support of rx-vlan-filter
 offload
Thread-Index: AQHV4XZMuWtgFfPCL0iJn9j5cpsS8agXKk0w
Date:   Wed, 12 Feb 2020 08:13:02 +0000
Message-ID: <BYAPR18MB2357232C87FC858DB55AD3E2A41B0@BYAPR18MB2357.namprd18.prod.outlook.com>
References: <20200212072959.lh76m5rrfa3nbhmd@kili.mountain>
In-Reply-To: <20200212072959.lh76m5rrfa3nbhmd@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [95.79.108.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79cfbade-4938-4d99-71fa-08d7af936177
x-ms-traffictypediagnostic: BYAPR18MB2376:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB23762BEE67556B9A25482F55A41B0@BYAPR18MB2376.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(53546011)(107886003)(4326008)(26005)(71200400001)(55016002)(186003)(54906003)(81166006)(81156014)(8676002)(7696005)(33656002)(8936002)(86362001)(6506007)(316002)(5660300002)(6916009)(66946007)(2906002)(52536014)(64756008)(478600001)(66556008)(9686003)(66446008)(66476007)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR18MB2376;H:BYAPR18MB2357.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2oBY/VIIJzdQ31/AqefTU8XaHi1OPX7AKcI38GTwWzmT9qhV0ZBXegroijoKO6cmrzzf0BMkIBxlSMT6teQRPmNuJU1bx6s8HQKuYW93y2tkQM0a2fGrBK/eogyPVRvkjomyJQocGhOYS0gqgKEbnkl3FmLTiW5snUpPuEZ8O6o054j08UIL9tLVv+2/t/sITKXro5phaxDbqvHZJ2VeJPrxIG3bDAszS5ysqqPrUATvyFiQiVf96Biwd7jdRdatqQeDW/JX6/qFvSM7Ro2czn6CYIdug4Wsz7bIVFmgSHh9lRPW3VVn7cLpsu0gwyUdk29u+XNFG/s1IjK+BHu5VVjaaswPD/o9FSMbY3NOyCPUPprJGDgTjNR1UCkL90lxQXT7Qwb4s0TP/4WJh7x4Y+3GVIpcXHLt7dYBYUWFkyPMR3k34JgSTTb+dq1AHBzU
x-ms-exchange-antispam-messagedata: GzCFLCFEBXbzW1Xn/4IB3FuzlmaBAu8P4kUc3JUyvLzT1vXOneakw2VFAl9MasjW9sidFvJP5s9fGg1vRzNmm1BNZeHvUKN9Fga/0e7M2HiG+TLSYynFkCJZ5fHsVLVDi4zoUPNqkmSwP9RTsGuEfg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cfbade-4938-4d99-71fa-08d7af936177
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 08:13:02.4936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJoVk3xgGdtx/mPV7s0CvxoSMx1qRzUpWMUE2TRHgLvQvAgwPMTiyyH3TWVOHp4OvRvSh4+4nGn4zhCGa/DoIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2376
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-12_02:2020-02-11,2020-02-12 signatures=0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for bug report. Yes, there is a missing of masking by VLAN_VID_MA=
SK:

-166              (!test_bit(be16_to_cpu(fsp->h_ext.vlan_tci),
+166              (!test_bit(be16_to_cpu(fsp->h_ext.vlan_tci) & VLAN_VID_MA=
SK,

I will prepare  the patch.

BR,
 Dmitry

-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com>=20
Sent: Wednesday, February 12, 2020 10:30 AM
To: dmitry.bogdanov@aquantia.com
Cc:=20
Subject: [EXT] [bug report] net: aquantia: add support of rx-vlan-filter of=
fload

External Email

----------------------------------------------------------------------
Hello Dmitry Bogdanov,

The patch 7975d2aff5af: "net: aquantia: add support of rx-vlan-filter offlo=
ad" from Nov 12, 2018, leads to the following static checker
warning:

	drivers/net/ethernet/aquantia/atlantic/aq_filters.c:166 aq_check_approve_f=
vlan()
	error: passing untrusted data to 'test_bit()'

drivers/net/ethernet/aquantia/atlantic/aq_filters.c
   151  static int __must_check
   152  aq_check_approve_fvlan(struct aq_nic_s *aq_nic,
   153                         struct aq_hw_rx_fltrs_s *rx_fltrs,
   154                         struct ethtool_rx_flow_spec *fsp)
   155  {
   156          if (fsp->location < AQ_RX_FIRST_LOC_FVLANID ||
   157              fsp->location > AQ_RX_LAST_LOC_FVLANID) {
   158                  netdev_err(aq_nic->ndev,
   159                             "ethtool: location must be in range [%d,=
 %d]",
   160                             AQ_RX_FIRST_LOC_FVLANID,
   161                             AQ_RX_LAST_LOC_FVLANID);
   162                  return -EINVAL;
   163          }
   164 =20
   165          if ((aq_nic->ndev->features & NETIF_F_HW_VLAN_CTAG_FILTER) =
&&
   166              (!test_bit(be16_to_cpu(fsp->h_ext.vlan_tci),
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ If this is =
more than 4096 then it is a buffer overflow.

   167                         aq_nic->active_vlans))) {
   168                  netdev_err(aq_nic->ndev,
   169                             "ethtool: unknown vlan-id specified");
   170                  return -EINVAL;
   171          }
   172 =20
   173          if (fsp->ring_cookie > aq_nic->aq_nic_cfg.num_rss_queues) {
   174                  netdev_err(aq_nic->ndev,
   175                             "ethtool: queue number must be in range =
[0, %d]",
   176                             aq_nic->aq_nic_cfg.num_rss_queues - 1);
   177                  return -EINVAL;
   178          }
   179          return 0;
   180  }

regards,
dan carpenter
