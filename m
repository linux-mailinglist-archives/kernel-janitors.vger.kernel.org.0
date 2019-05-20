Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDFE22B5F
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 May 2019 07:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbfETFnm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 May 2019 01:43:42 -0400
Received: from mail-eopbgr130070.outbound.protection.outlook.com ([40.107.13.70]:63374
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725807AbfETFnm (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 May 2019 01:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu9FZSU02YyFspJ2JSmkuUX1BpVOZlFv9wXLfeue16U=;
 b=RqfC3qpbySxvXqln2VP4gUNAPvRR2uvbYSL4VJZ0v5jNbAlYN/T527GCIcbYoxKk6st5jE5kLFkApyzhUWkgBhMyGueSn8dEpoNZz+JhaecHxzr7AxYxbEqyWGwVZVhZNLcE/nTZKQvFkBYQzWoMPpqK0It/6I2VX2OEUyieQTU=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4958.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 05:43:38 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 05:43:38 +0000
From:   "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        nd <nd@arm.com>
Subject: Re: drm/komeda: Potential error pointer dereference
Thread-Topic: drm/komeda: Potential error pointer dereference
Thread-Index: AQHVDs75IJ2/qTTzt0+NH2vjSD797g==
Date:   Mon, 20 May 2019 05:43:38 +0000
Message-ID: <20190520054331.GB1724@james-ThinkStation-P300>
References: <20190503122525.GA29695@mwanda>
In-Reply-To: <20190503122525.GA29695@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fe05b8e-94d9-4b49-07d5-08d6dce61b6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VE1PR08MB4958;
x-ms-traffictypediagnostic: VE1PR08MB4958:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4958007CFDC2BA717B0685A1B3060@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(346002)(136003)(39860400002)(376002)(396003)(366004)(199004)(189003)(66066001)(11346002)(8936002)(54906003)(81166006)(58126008)(55236004)(8676002)(305945005)(6916009)(99286004)(476003)(486006)(6246003)(5660300002)(7736002)(81156014)(86362001)(446003)(256004)(71190400001)(71200400001)(14444005)(229853002)(33656002)(316002)(6116002)(386003)(68736007)(14454004)(2906002)(52116002)(102836004)(6486002)(66946007)(1076003)(53936002)(478600001)(6436002)(186003)(26005)(33716001)(73956011)(3846002)(25786009)(6506007)(6512007)(9686003)(66476007)(66556008)(4326008)(64756008)(66446008)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4958;H:VE1PR08MB5006.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +DSEyaH1kgLMz3u0kiLdhG3Zr8xB+Mk2niys6p/e6ZofcsdH83qE3aw4DwevshUCAmJcIo9cX8FtlI87SD3th7JzVKJZydGNoWudsESsp34r89qQnd3ccrLhqL2UU72rwjHEqI/Zh6Ay74T+Rds2ruwfMNVTlnVKaDG5Z8GA1baskwb6gtb43lo9uKTz6HOo59pORUofZjkdb4mRJ0TqsvzoJyCHZY5sLx/hxjX8PDyUDO/a01RlUdreT09LSjlfKlkImxbIVh3QCdwlzhKgPbB/d5mqYqDhQ3Jy8nxsq7Q8Jjw6JpFSBuWoHfqOnHNyjpqx78HWUXjFJFOupy5/bNsGXg0e0wIRgia5QohtEBFnLd9lrjbpvtTXEtr/p1fUv+z0VNFzi/oWocn1EUYphUI3tc2kmGeD2DbR2mE3FUU=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1A8BFFC4EC453A408D2336704001C380@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe05b8e-94d9-4b49-07d5-08d6dce61b6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 05:43:38.2864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

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

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.co=
m>
