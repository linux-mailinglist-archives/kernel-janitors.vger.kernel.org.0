Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26BCE142DE7
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Jan 2020 15:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgATOnu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jan 2020 09:43:50 -0500
Received: from mail-eopbgr20078.outbound.protection.outlook.com ([40.107.2.78]:20389
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726942AbgATOnu (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jan 2020 09:43:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnwLJRem4WzgyjDJcUo0MlHgjZ3Xb0SwlPJow164flhWbmi5x1HqncMH5fEsyO+IN/5qyy+78+2xVSgJMzpl5jmtNHC+MCPYjPVTXc+jr9BV99bsYpCAG12D/Hx11bS1gTuLfyEPkndIdZSy2Qv1HRAZWWOmy9bjCZTtssesbpakIEfbdxYFqwBW4HoxasUoPUqB2z63+8fZbqmU7f9euVsxT5em1bNoh4nCqI/bw8kXzZR7ai5yXLRGSsORaovzyRyXA3tBZWTdP+jMJYvJPx2h5EiFG05tLcgv2YbE7fbrSuYazhwhD5DnvUvHndEuCO1t47+5kA/Rqiz6SsNxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viVgOnBtR+STFlwb0v1aFDqCY8R10V/xW2l7TIr5uRM=;
 b=hAl7yQ+AAO0g1QTieTj6viEghghYoA6ykhpgKCSzO0IRFMceeEaT133rC5MRsE6CEWWAx7IaTof43jLkCwuhsJqdlGAOHzC7wLALYT2jy2hEkv9qsEGYyDlopEyRBD4omt1rP4ardv1NlorME2M1gcUkZnPPXQgGVlpyvtV8TCDFLXMyRNW9odbxmlcYTdLG3qk0RI0/Ov9WVPXzK8SbHJI8sSE0t9hobrlvE9F4C26eaFVST7aB4SXYwNe2ufNjw9//8eZYr2NlEgP3f8dQvccGEq/TrQWgcbfV+ksssXmJxzWu1FekgPaEa8Db1Vt32nnap/fB8lFpDqputg9hzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viVgOnBtR+STFlwb0v1aFDqCY8R10V/xW2l7TIr5uRM=;
 b=HGVRYem3nyBpe2JKCk8s/zpISfa8F3q3At6Cn2JoHzHWnooD9yNMiwV6hPdimxf3yc0/Ymy2ShjLTqvrvw38pc5pUQfEMPZNaHqdXhBTZbEWa1jHy9VrAc+IexnCw/ekNj7FmR5shnGq4akK36hih1vBxC7oeWtV6yBj+bh0w44=
Received: from VI1PR05MB6734.eurprd05.prod.outlook.com (10.186.163.17) by
 VI1PR05MB5552.eurprd05.prod.outlook.com (20.177.202.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Mon, 20 Jan 2020 14:43:45 +0000
Received: from VI1PR05MB6734.eurprd05.prod.outlook.com
 ([fe80::5d57:f705:a027:9cb8]) by VI1PR05MB6734.eurprd05.prod.outlook.com
 ([fe80::5d57:f705:a027:9cb8%3]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 14:43:45 +0000
Received: from localhost (193.47.165.251) by AM0P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend Transport; Mon, 20 Jan 2020 14:43:44 +0000
From:   Ido Schimmel <idosch@mellanox.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] netdevsim: fib: Add dummy implementation for FIB
 offload
Thread-Topic: [bug report] netdevsim: fib: Add dummy implementation for FIB
 offload
Thread-Index: AQHVz58h/CiQSkiRd0OrtDlkH2pkT6fzoMYA
Date:   Mon, 20 Jan 2020 14:43:45 +0000
Message-ID: <20200120144342.GA3582580@splinter>
References: <20200120143712.wzgjjpwuvrtbioef@kili.mountain>
In-Reply-To: <20200120143712.wzgjjpwuvrtbioef@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::20) To VI1PR05MB6734.eurprd05.prod.outlook.com
 (2603:10a6:800:13d::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=idosch@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e1ac3cec-ca67-42e8-6f6d-08d79db726c1
x-ms-traffictypediagnostic: VI1PR05MB5552:
x-microsoft-antispam-prvs: <VI1PR05MB55521EDF313DFCB72B81D145BF320@VI1PR05MB5552.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(346002)(376002)(366004)(396003)(39860400002)(189003)(199004)(478600001)(81166006)(8676002)(81156014)(966005)(8936002)(66446008)(66476007)(66946007)(66556008)(64756008)(316002)(6916009)(4326008)(1076003)(71200400001)(6486002)(5660300002)(2906002)(86362001)(9686003)(956004)(26005)(33656002)(186003)(52116002)(6496006)(33716001)(16526019);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5552;H:VI1PR05MB6734.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8NkWj2TaTDDYLN6afZ64C/wCfh1Ap5CXxy9OfOnPnLO5tPLrtd1uui4E8O4a7s+8fKzvn7K4hGQqjxc3vwN7TvLbRzHq093qI8V7gz4uZik/Fwqf36f+079ggHLt+uM2yc4mOwHUknnEXbWioJG/3aGDD1QAJtYmrUoqMeAQ5sgWJArPL21x0/jkxHQ+QPNDOqJ4FznE8IKND10c1SbkX23X405yEbp6j9lrHp3eb7hcNX6ebDgo/41ctHPufF/BREblNR3hTnjNOSG6qsCt8LTwuhWZq9oIRgdgALDvZ/DUkEPVCG4GjaTR1gsLKTB707FsRYIrPelLms7kJD6zdtTHN/e8xa7xRJaVP9ovZ5AkqpmCXIebcqahfE0BxJ5/lLSW8ercsptFAG/6FVAeF9U3XruqzxqOGHc0qO1HZ8RMz+01Pld+nmnWWpUP1sxklLF4C7YZjAE515VBrDka8JVQvIQsy+4bsHKjsQeZT0dLDDdcwcpaOpj0TEj+1nJeuE+vh6OsilU1zhuXJp9MQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3566D10897BE2A45AA424FEAF7121861@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ac3cec-ca67-42e8-6f6d-08d79db726c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 14:43:45.2943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWRlreLAHSsmrupveFrml9Pw8ZPe3p1KXYGghp1KE6N7aB5Qgnj+QIDOcnoc2o1p+2ErM4zzJZ0UBNJW8Kfg/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5552
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 20, 2020 at 05:37:12PM +0300, Dan Carpenter wrote:
> Hello Ido Schimmel,
>=20
> The patch 48bb9eb47b27: "netdevsim: fib: Add dummy implementation for
> FIB offload" from Jan 14, 2020, leads to the following static checker
> warning:
>=20
> 	drivers/net/netdevsim/fib.c:663 nsim_fib6_rt_insert()
> 	error: 'fib6_rt' dereferencing possible ERR_PTR()
>=20
> drivers/net/netdevsim/fib.c
>    460  nsim_fib6_rt_create(struct nsim_fib_data *data,
>    461                      struct fib6_entry_notifier_info *fen6_info)
>    462  {
>    463          struct fib6_info *iter, *rt =3D fen6_info->rt;
>    464          struct nsim_fib6_rt *fib6_rt;
>    465          int i =3D 0;
>    466          int err;
>    467 =20
>    468          fib6_rt =3D kzalloc(sizeof(*fib6_rt), GFP_ATOMIC);
>    469          if (!fib6_rt)
>    470                  return NULL;
>                         ^^^^^^^^^^^

Dan, thank you very much for the report. It is already fixed in net-next
thanks to Eric Dumazet:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/=
?id=3D41cdc741048b0d04604c02aad9ec19f7d9130b70

Can you share the static checker you used so I can avoid these mistakes
in the future? Alternatively, is it possible to register development
trees for this service like with the kbuild robot?

Thanks in advance.

>=20
>    471 =20
>    472          nsim_fib_rt_init(data, &fib6_rt->common, &rt->fib6_dst.ad=
dr,
>    473                           sizeof(rt->fib6_dst.addr), rt->fib6_dst.=
plen, AF_INET6,
>    474                           rt->fib6_table->tb6_id);
>    475 =20
>    476          /* We consider a multipath IPv6 route as one entry, but i=
t can be made
>    477           * up from several fib6_info structs (one for each nextho=
p), so we
>    478           * add them all to the same list under the entry.
>    479           */
>    480          INIT_LIST_HEAD(&fib6_rt->nh_list);
>    481 =20
>    482          err =3D nsim_fib6_rt_nh_add(fib6_rt, rt);
>    483          if (err)
>    484                  goto err_fib_rt_fini;
>    485 =20
>    486          if (!fen6_info->nsiblings)
>    487                  return fib6_rt;
>    488 =20
>    489          list_for_each_entry(iter, &rt->fib6_siblings, fib6_siblin=
gs) {
>    490                  if (i =3D=3D fen6_info->nsiblings)
>    491                          break;
>    492 =20
>    493                  err =3D nsim_fib6_rt_nh_add(fib6_rt, iter);
>    494                  if (err)
>    495                          goto err_fib6_rt_nh_del;
>    496                  i++;
>    497          }
>    498          WARN_ON_ONCE(i !=3D fen6_info->nsiblings);
>    499 =20
>    500          return fib6_rt;
>    501 =20
>    502  err_fib6_rt_nh_del:
>    503          list_for_each_entry_continue_reverse(iter, &rt->fib6_sibl=
ings,
>    504                                               fib6_siblings)
>    505                  nsim_fib6_rt_nh_del(fib6_rt, iter);
>    506          nsim_fib6_rt_nh_del(fib6_rt, rt);
>    507  err_fib_rt_fini:
>    508          nsim_fib_rt_fini(&fib6_rt->common);
>    509          kfree(fib6_rt);
>    510          return ERR_PTR(err);
>                        ^^^^^^^^^^^^
>    511  }
>=20
> This function should either return NULL or error pointers but not both.
>=20
> When a function returns a mix of error pointers and NULL, the NULL case
> should be a special kind of success.  For example, we request a feature
> like debugfs but it's disabled.  That's not an error, but we also can't
> return a valid pointer to the debug fs file.
>=20
> regards,
> dan carpenter
