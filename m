Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 552DD139E4A
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jan 2020 01:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728838AbgANAcq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 Jan 2020 19:32:46 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:54258 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728733AbgANAcq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Jan 2020 19:32:46 -0500
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00E0Q2Pm000704;
        Mon, 13 Jan 2020 16:32:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=PixzWnDHroYHeS4qzNk7BcTEhNZ4hC09tYWwX+dyfgg=;
 b=NJ0agZ9cLdHPPlw8aFfKdDAQn3J+1FeB8o3f47WLO+ulH58xya9jabTlLBnOv2hiQ6Vi
 FfhoUbUfFLzbAvROFx1ncuJyUwd3G5QoL9RLK996quZrDUB4LL/hiurwW2XLuA6Emi9A
 Zn4pMEySDoMVSTgRgejciN4BPobuOzhCs94= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2xgw2ehw60-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 13 Jan 2020 16:32:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 13 Jan 2020 16:32:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiHqWqo8oWjtT+sr2jqOwERG89pu7ouV4bwDhlN0m8xF2n7eji7nOA5OzswGD63uuWESJKxAGGfKaLwkD5gfpzoRKtq7egEt93DEVq3qSr5eif6Dyhg21leM/cdJWa2A/4hhR7VeZyuP03D6ceowmenXpp+x9pyMVAQLLfv0Py8ELyf0Q3dGlulm9dCGBaCLhc39uKV+sKKBqdcmAn/cfuNKL/jRi3idrH5QW1E/1Wg2QShlf+WymS4QaUvLTS1/C37pkUbDL87MSsluQ3ec22Btlz7vMMd9gawhIUcaXad7WUP0fOSvnsC8uLfGseunGmk0ASnJji3eqJxWLpK2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PixzWnDHroYHeS4qzNk7BcTEhNZ4hC09tYWwX+dyfgg=;
 b=Mq+p31FAsQc7klyvDtISD3oflwEp9lRAOY/nRo2NpEdZvYFPSx+BFu/Ku/ljAE8IC+PIwMl1p3vzgbyXoQuF+psuDCadTvgC4LKtNRXvcXCx/RvBAs3sq7xv0oXFSemRHvPL9fTUOVb7URvBOBbzoCHGL9G/g7hbKVPgI5Ej/Z4CaZOAjoFSMOUBGk5ADxfy5BLNQpUPHiJ3+RpmlKDFxjM0JEgsQ4c9dgzuH9LmcvivIFclfHxMr1YOpkjj6GXUYnN1EnJVmNB3rMIHy+AYgx3vMRHKk19FaZHrbODlShmmXNxIvTUDm/iHn2sCjh8ba334Tf5Mf4YLhwha4PtGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PixzWnDHroYHeS4qzNk7BcTEhNZ4hC09tYWwX+dyfgg=;
 b=Nr1hWWCP+LfjTz60jpQHOV7DOeZDUjJ7gWzc3dsz/XWF276I+L73o6E6VAVOZRXz660MXpG3f9yevZ+YbkcQxHOr7KaXK7GgCloIVMVXt4dR+mFY1wDCVSpLzvAdW5TLH9Th3VZ8Cc9VkobFZiiVXqMmxjjdyxZY7aNl4/fUlx4=
Received: from MN2PR15MB3213.namprd15.prod.outlook.com (20.179.21.76) by
 MN2PR15MB3518.namprd15.prod.outlook.com (20.178.255.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.14; Tue, 14 Jan 2020 00:32:36 +0000
Received: from MN2PR15MB3213.namprd15.prod.outlook.com
 ([fe80::6d1e:f2f7:d36:a42f]) by MN2PR15MB3213.namprd15.prod.outlook.com
 ([fe80::6d1e:f2f7:d36:a42f%4]) with mapi id 15.20.2623.015; Tue, 14 Jan 2020
 00:32:36 +0000
Received: from kafai-mbp.dhcp.thefacebook.com (2620:10d:c090:200::1:34fe) by MWHPR02CA0003.namprd02.prod.outlook.com (2603:10b6:300:4b::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10 via Frontend Transport; Tue, 14 Jan 2020 00:32:34 +0000
From:   Martin Lau <kafai@fb.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS
Thread-Topic: [bug report] bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS
Thread-Index: AQHVyhJG6iqHuC8vFE6rvqPw9II3QKfpUBMA
Date:   Tue, 14 Jan 2020 00:32:35 +0000
Message-ID: <20200114003232.pmpq3i4jwgfoi6n7@kafai-mbp.dhcp.thefacebook.com>
References: <20200113130617.7ecdrglwlmofhvrx@kili.mountain>
In-Reply-To: <20200113130617.7ecdrglwlmofhvrx@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:300:4b::13) To MN2PR15MB3213.namprd15.prod.outlook.com
 (2603:10b6:208:3d::12)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:34fe]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3363877a-c516-4e34-754c-08d798894066
x-ms-traffictypediagnostic: MN2PR15MB3518:
x-microsoft-antispam-prvs: <MN2PR15MB351846C2FFD1483D03896081D5340@MN2PR15MB3518.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(189003)(6916009)(5660300002)(71200400001)(4744005)(66946007)(66446008)(66556008)(6506007)(1076003)(66476007)(7696005)(86362001)(64756008)(52116002)(2906002)(81166006)(81156014)(316002)(8676002)(4326008)(9686003)(186003)(55016002)(16526019)(8936002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR15MB3518;H:MN2PR15MB3213.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nD3FK+EJMyoSvvf4sj7/CLWt9oN2UtftkwVeptKz/gRwfROB1eqwgfjeURi0gzmw0IlmcdYI2RR8IbPwPleX5eAL4j6mkuy5gm9grt3/s8bT+EZB9v46hQSJCUHLyDAXDVb2HrE2JG1g1g7WlXGn0NFWxNnDInBv3rBPHxNd4Q7QS+SzNzGBrmz5J6O4X+HhE75bAamcIt5xg8lyMQKX0F+/WikII4i/9cl9R5p5WwGYTQ9dH5DqdsRb01US2ZOMrEwpxEqd8vIU0Ap8GqZav2TbOTRXye6nx28cQodGeEX8onbLdTaXl8cTocQkHWaF33Tskb5Jb8lJ6/dPiOjjkVvGcM9ERksahCbgXbvTqWgwYmVmBHDizXtC5skQ0NwSbSqBbyehMkAnS1fxArqBexF7DWpbH2W4MPIBMA0qtV3trFsV8GXgz3889Cxg+06P
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23C1EBEE18345B409CB4BD09EC1DFD84@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3363877a-c516-4e34-754c-08d798894066
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 00:32:36.1478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHS5bA52rKboNTA54YstnEPm9hJtHpEjRQKhfEO6nKt8l0CBHNL50O6AcDd7zclY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3518
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-13_08:2020-01-13,2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 lowpriorityscore=0
 mlxlogscore=393 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001140002
X-FB-Internal: deliver
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 13, 2020 at 04:06:17PM +0300, Dan Carpenter wrote:
> Hello Martin KaFai Lau,
>=20
> The patch 85d33df357b6: "bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS" from
> Jan 8, 2020, leads to the following static checker warning:
>=20
> 	kernel/bpf/bpf_struct_ops.c:501 bpf_struct_ops_map_seq_show_elem()
> 	warn: 'value' is an error pointer or valid
>=20
> kernel/bpf/bpf_struct_ops.c
>    495  static void bpf_struct_ops_map_seq_show_elem(struct bpf_map *map,=
 void *key,
>    496                                               struct seq_file *m)
>    497  {
>    498          void *value;
>    499 =20
>    500          value =3D bpf_struct_ops_map_lookup_elem(map, key);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is just a dummy function that only returns -EINVAL.
Thanks for the report. I will post a fix.
