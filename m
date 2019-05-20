Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B85722B2F
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 May 2019 07:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbfETFiB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 May 2019 01:38:01 -0400
Received: from mail-eopbgr130042.outbound.protection.outlook.com ([40.107.13.42]:57598
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727069AbfETFiA (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 May 2019 01:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs6bNwILKP5oILv7Hfq1bkr2k1jKxsSUGpjXjjUlbbU=;
 b=BDd/S0RlC3l3JWwecIC+BXBe7iyfwu1CiExSgHr34/h+p3d1uIDAu4Uj2iuFbrGEQK5frx1dcP/n0RchHgoMd1QptQ8tQ6yp6cPFqc87kh8SNMIwlxaAIUGJtqrc3o6kHvIS1XFg5LynnoqrUFyW6vt1yV10NRsusviRXKi1A2g=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4958.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 05:37:55 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 05:37:55 +0000
From:   "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        nd <nd@arm.com>
Subject: Re: drm/komeda: Potential error pointer dereference
Thread-Topic: drm/komeda: Potential error pointer dereference
Thread-Index: AQHVDs4sZjc2KsmCH0WNvaCQQ5WVmw==
Date:   Mon, 20 May 2019 05:37:55 +0000
Message-ID: <20190520053748.GA1724@james-ThinkStation-P300>
References: <20190503122525.GA29695@mwanda>
In-Reply-To: <20190503122525.GA29695@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0065.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9de04d61-490e-4df8-cb77-08d6dce54ef1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VE1PR08MB4958;
x-ms-traffictypediagnostic: VE1PR08MB4958:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB49585447F70DAF6F26FF9AECB3060@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(366004)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(66946007)(6486002)(102836004)(1076003)(68736007)(6116002)(386003)(52116002)(2906002)(14454004)(6512007)(6506007)(9686003)(73956011)(25786009)(3846002)(66446008)(64756008)(66556008)(66476007)(4326008)(76176011)(6436002)(478600001)(53936002)(33716001)(186003)(26005)(305945005)(8676002)(99286004)(6916009)(55236004)(6246003)(5660300002)(7736002)(81156014)(476003)(486006)(11346002)(66066001)(58126008)(8936002)(81166006)(54906003)(229853002)(316002)(33656002)(86362001)(256004)(446003)(71200400001)(71190400001)(14444005);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4958;H:VE1PR08MB5006.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x/BtK7fWE7CznVdapvxihRU/5s1U/uu+09bw9XbOEaneTDhuHr2rPXF/nyyMak2E685I3OWuEkD3MRJGz+w3m0l9VKxmj6lFZd0STylajy5fUoGWszmmG1/b5MftL4oFQ/RadkQwohzUl+IRXaRidIltEv82qB1c5cvx7xfn7lPgzLgXAWlG1PtRAgzLP8hXVPbR0p3yFR1Iw7geJj0AqM7VGswbyhfiQ7P9ffZSO0VOPYbCb7xQeY54CRw+O2iW0EF/gDqG/tG9rqfIukHw0jgzS8Y6ciVdzDAxeSoNtR72/zG9AvU+7l2CeG+W8FThWHFr4p8oyrO+NOul6z035zYdjnmFHx3O9H7JgljHYKrEH510oRThTfiiVmIGRLaYAXozzuvLtT4TddbCI1APZChgQeuQxBJi4sOkQsp6f1U=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3ED8629A5D8EBD49B046F77750C758AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de04d61-490e-4df8-cb77-08d6dce54ef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 05:37:55.4811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan=20

On Fri, May 03, 2019 at 03:25:25PM +0300, Dan Carpenter wrote:
> We need to check whether drm_atomic_get_crtc_state() returns an error
> pointer before dereferencing "crtc_st".
>=20
> Fixes: 7d31b9e7a550 ("drm/komeda: Add komeda_plane/plane_helper_funcs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/=
gpu/drm/arm/display/komeda/komeda_plane.c
> index 07ed0cc1bc44..c7e5fc6e5500 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> @@ -64,7 +64,7 @@ komeda_plane_atomic_check(struct drm_plane *plane,
>  		return 0;
> =20
>  	crtc_st =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> -	if (!crtc_st->enable) {
> +	if (IS_ERR(crtc_st) || !crtc_st->enable) {
>  		DRM_DEBUG_ATOMIC("Cannot update plane on a disabled CRTC.\n");
>  		return -EINVAL;
>  	}

Thank you for the fixing.
--=20
Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.co=
m>
