Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4423C2D1725
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 18:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgLGRJC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 12:09:02 -0500
Received: from mail-am6eur05on2060.outbound.protection.outlook.com ([40.107.22.60]:4832
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725822AbgLGRJC (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 12:09:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRJKLalhrB/y0i9FmhBhtRuu/qEbqsMkwNWhkwWWCC1PnjQP29OJkqi9Q7VHr4JNcLG67i1KS3mt+KSfXvqAHqsH+21H6Q1CozHL4Sdrrz5wrN7hKN1E/XQiRPcuz97WzMj+3cGu2mb0PwuqvUYUAkio4Cas9pWmN2QiljhCCZg6Ar+PwzUcaHhAV1DluM3gLKjrt3E0DHRA+jf3TYrnkAZh0nkZP1PeCdDtTevPGiz4zPJqXw3da/w5jqhbJ0+TiPCgthXDt5NJpUQYw8Ie5b19qMZPbbNd2H60ZLLiUw567WsR7w24LOBRGAJIkkxrteFhAGvsgFwYqevtxp92mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5l8E5iyPfAaoeTcJ/2P5cCF0ss7YNuQXHjjHcDO2UA=;
 b=OtQWmd4vyeQMzCgYjndRZRa41RgmHowVXPL9OxS5HO/hcsK/WyN0qG3LChXDBHai9hDkQl1Tdf3zhdwy9K8j283h15Mdy3Q+em0szZNK7MCqlsKReueviMI/dJG39bX4zzexEa2adOC3FV9IxTchBzc0dFd3S8otVfY3ACfOXjYLCss5nNnsKdt2Qv75zzmRkTGnhaAo26F7i4PeTd4TOxhQaP9bcxpPF+LsQKbTNGjVARHmpYPZ0DAMtQqvzJ8eGR8v0MjZTo7WPXiXlATxYN+begaGsffOnjlcttVsUGhaLH6VsDAkVScVhBGABRn6RiSOBiDzeEBsvGh4VwLq0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5l8E5iyPfAaoeTcJ/2P5cCF0ss7YNuQXHjjHcDO2UA=;
 b=x4JfI2+dbVz6u/4Ks/9H6h5Q1xF3+i1z+fCcJzMosUI3KkC9V04sU1oxDahSujnGOBfDAzGntvIx1TJU6qC/iCoCUgmCkapSiJMy1EqvGzKlDxXppO+9nJviyAzkSJS1e3PKuBxRpmEPn8tLNOp/Mooz0SqPcSEzHKtGt66vz+U=
Received: from AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:aa::16)
 by AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:ed::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 17:08:13 +0000
Received: from AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5438:1932:b075:be6c]) by AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5438:1932:b075:be6c%6]) with mapi id 15.20.3632.021; Mon, 7 Dec 2020
 17:08:12 +0000
From:   Adam Ward <Adam.Ward.opensource@diasemi.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Adam Ward <Adam.Ward.opensource@diasemi.com>
Subject: RE: [bug report] regulator: da9121: Add support for device variants
 via devicetree
Thread-Topic: [bug report] regulator: da9121: Add support for device variants
 via devicetree
Thread-Index: AQHWyk3NVE2lIRYPVUycliKZjTPi06nr2Asw
Date:   Mon, 7 Dec 2020 17:08:12 +0000
Message-ID: <AM6PR10MB2807C57FD4B840E006434443ECCE0@AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM>
References: <X8pOUyVj5Q8iQYJI@mwanda>
In-Reply-To: <X8pOUyVj5Q8iQYJI@mwanda>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b99b0e3-2cc0-4bd0-21e6-08d89ad2ae35
x-ms-traffictypediagnostic: AM6PR10MB3399:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB339980D1F9A761158C879236CBCE0@AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kTyXgaFOpM4PbV8itmY5GTQEzbWTrKSb665JMHzbwLKI3E3lYAcAttLPMGNbV2Q0cTDyRVQ1WJP9wD+B72RvtJ8hQRx7dTrrNYa7M194PMoRbCsHg348g0bSyPzsj33f80e3sJ4tQ1ICRhkwdxGVfyUSkTN0X/ojs3yMYdRoEtmha9iDf/2spCUCaYnUj5lVu4Gg+aGIEl3lh2JYe1zrdZSCy474U+Pw2ZDUBypZ9Fd0qztit2aVQs9+LI0HyH0H3cc2kK9Gt39xYQzyNzLDWifgNTq4sKj7KBfxnICCOrX0HVesGCXfIh8f9H47ZJEaYyZnJ9h2te87irJREN0ubw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(186003)(478600001)(86362001)(71200400001)(8676002)(33656002)(7696005)(66446008)(66946007)(8936002)(9686003)(76116006)(4326008)(55016002)(64756008)(52536014)(107886003)(5660300002)(6916009)(54906003)(66556008)(66476007)(26005)(4744005)(6506007)(2906002)(316002)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jwzkK/xwcpiTOcP7RploOWNbnuT/hu8sWd/gB1nK5SV6GiBWzw4sSc5xFw3K?=
 =?us-ascii?Q?TUWtMos6bzVFytJi6BhMAq/y/iVoGqvZDlo6uzGFhH8cjgl0VseEyqbdpuZi?=
 =?us-ascii?Q?t0ko4b9o2mZG37JUYWz0ECOPFkY9c4jC2rZeu06feICy3iE5H+ECTmafM1VC?=
 =?us-ascii?Q?AYGD3PdZrQO2rVlnVs4sj1yfqY59BdbqNoRVJAwvZiTLDWrfDucW2sOGbOUC?=
 =?us-ascii?Q?0Cqugua09H1KzTq/s8YPeG1SKJQLpRRaVIeB+IkmO6LfnURCZxvQQ/1rZGsT?=
 =?us-ascii?Q?l5g5bYnrD8rePMGi1jfOkS/RWaGGYbZxXLNR6qSF9Vuy34MLekdM15WHKL28?=
 =?us-ascii?Q?C8T74DrSgHoYKMFfN7hQFR3Hm4MAtwUFgBSq79iKLHle5S2y6zsFl6sLthti?=
 =?us-ascii?Q?TcywF7/S6flaIyqc/hiB2pdAig32SlWoH65Ex1MjBMrpf4KabmkOe2Q9+FY4?=
 =?us-ascii?Q?vt2bnwwJIo3sDfiumw39CWO4NtGJ/xLbS+v5LqvooDS1WE1B0BjIE4GsJEre?=
 =?us-ascii?Q?xwyRDohIeyQZRglthAQ8BbaPGwqEyPoQR3BNgOBjF5hBFM0xT44VmjE9IU6P?=
 =?us-ascii?Q?LbYYUmiBIJiR/ERpMSLTs+aVRvbzHaVeVTqA58moAfzkCIVO/j00g2cuPWKa?=
 =?us-ascii?Q?ufmgk4+Bvsfas5NWDE3f41BfTZxWz3cErdFjLK7iiV0BCPU4+mld2u1P005D?=
 =?us-ascii?Q?QwmzBHi8sRgQWXxx8Hj23SahNUYTKSkfb6Nzwg8hDtp/+QWtMw0Nw9rV7BgU?=
 =?us-ascii?Q?7JLHW5VVuX9HJgxqZYagdGpOhNXYeuv0YLDpkJd6FvXVaVE994Cqm+YjYCvp?=
 =?us-ascii?Q?2JvsnlOB8KeTxNiAsN/H5PDlTGGuE6SOOryzpjQCWaQBmB999KMWhyDcfXDW?=
 =?us-ascii?Q?6AeZEUAGtk/5lNUsoLXA9tfLJuTI4Zb4BHTx4uH3+UxNLXvacSYFdJL6XyQc?=
 =?us-ascii?Q?pCR5gEw7VTwSGOZ2sjZkLaKXZdpfQd0JZgN3n/VmNh4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b99b0e3-2cc0-4bd0-21e6-08d89ad2ae35
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 17:08:12.8912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLJxLEh52e2p4/im4V76xvFPyf+gyNA3vMImh8whaQwrozTuY1R5AeynDApcarlykxs2UzcjfHIjYBRC/kYGhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3399
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 4 Dec 2020 14:57, Dan Carpenter wrote:

>    366          if (pdata->num_buck > variant_parameters[chip-
> >variant_id].num_bucks) {
>                                     ^^
> Smatch is complaining that this sort of looks like it should be >=3D
> instead of >.  This looks true to me as well, but I'm not positive
> enough to actually send a patch.  :P

As it goes, that bit is fine - it's for if a second buck is configured on a=
 single buck variant.

>    383                  if (of_property_read_u32(da9121_matches[pdata-
> >num_buck].of_node,
>                                                                 ^^^^^^^^^=
^^^^^^
> We know that .num_bucks is 2 here so if ->num_buck is =3D=3D to that then
> this is one element beyond the end of the array.

But this is a nice catch - thank you.

Regards,
Adam

