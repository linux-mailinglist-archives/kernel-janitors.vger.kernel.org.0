Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3DD1CF0DE
	for <lists+kernel-janitors@lfdr.de>; Tue, 12 May 2020 11:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbgELJD0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 12 May 2020 05:03:26 -0400
Received: from mail-dm6nam11on2066.outbound.protection.outlook.com ([40.107.223.66]:30264
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729466AbgELJDZ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 May 2020 05:03:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8aHGadc+QjL6av5LiaCgg1B/nnm/7rjFTF1oeT0ET9tgAPPH+Qvvm7EwFxI5cllGnMc0yDvq4u0c0O1OGLEOf5m9XrXZ/LZu+8rJzQyzBKPbun0hA//4C7YyPx09HGokrOdc4Gui30io/j7vtHbFf2HEvn+ajK3TqnqNx1oAJo9dr+TAgfkvPkpvqpVCrzRwuerLuxQQqiGc5l4qNxseF6MbgmU5oEduK/Vv8acMk9+2xU6Q6eapnQqWhEXqQhj+rBRHwFX1f2AnmE+5B0QJkr+oe+XP5Vg6k/dsVP8OH/3DgImtUczQ4BjFwWCtrgGaKts0DtG49QnExU+iIrQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQIZYYMUaZOPQPhubg++Qf1Qbaw9EpTpFqQ06SmBOKk=;
 b=TArrBnEkzjDvUmzgHTxgcNcvNBXhkr4+5qyiB3t/vmdQb9+dkPIPIW6LJa9lFndETvFbZZn0svoCIfd1fihdIiY+unT4cmrLQzJ921n6WQJ1TjV5Krqro2XHK2G9X+mIbuDgKEUMDU9biI6cknz7aYWdDpGXIfr2bABupFtowxmqMFT8qpAO8I2n3q7bzRj4/g0af0ilI6DTsP4zfh5zxOrOOrxuMMgRoy2msDdu8irJIAlb9CQS0JXujJzb1jPqF+XPYQaBssoxLRhpXTWdJWX9NSmBOhF2xjPZ+y0hRUpnYUeZo5brra0Jo8vAZSmYurMT927Z65mz4OvcejmHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQIZYYMUaZOPQPhubg++Qf1Qbaw9EpTpFqQ06SmBOKk=;
 b=iTR2dBwwzQ8e+ux/pLeIb2s1gXEBDWLzqShiDlCwk7A262dczu7JfM/G08+vOyvWniqG8KWyLIjnkUGHA3r4KyD09dOlR+YBKpQIrDYbQJtUOxw69awZ2Iz57wOuOdeeCqpIvXfuhUK0HpyDazZtKIYhzOJa2K7RPbO63QZCtAY=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=silabs.com;
Received: from MWHPR11MB1775.namprd11.prod.outlook.com (2603:10b6:300:10e::14)
 by MWHPR11MB1726.namprd11.prod.outlook.com (2603:10b6:300:23::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 09:03:21 +0000
Received: from MWHPR11MB1775.namprd11.prod.outlook.com
 ([fe80::e055:3e6d:ff4:56da]) by MWHPR11MB1775.namprd11.prod.outlook.com
 ([fe80::e055:3e6d:ff4:56da%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 09:03:21 +0000
From:   =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: wfx: unlock on error path
Date:   Tue, 12 May 2020 11:03:16 +0200
Message-ID: <2556639.E3UUflA7rB@pc-42>
Organization: Silicon Labs
In-Reply-To: <20200512083656.GA251760@mwanda>
References: <20200512083656.GA251760@mwanda>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: SN2PR01CA0013.prod.exchangelabs.com (2603:10b6:804:2::23)
 To MWHPR11MB1775.namprd11.prod.outlook.com (2603:10b6:300:10e::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-42.localnet (82.67.86.106) by SN2PR01CA0013.prod.exchangelabs.com (2603:10b6:804:2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Tue, 12 May 2020 09:03:20 +0000
X-Originating-IP: [82.67.86.106]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96b693e6-92a5-4d00-61de-08d7f65351c4
X-MS-TrafficTypeDiagnostic: MWHPR11MB1726:
X-Microsoft-Antispam-PRVS: <MWHPR11MB1726D856F0DE368D4DA9A59393BE0@MWHPR11MB1726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6RFzfZ93BJvuZeRsK8A2mMF4GVwQaQ+3N6Tf6bewa6oMaGDAzvfH2SGwe5PW0vW2/KLj0ORYUMIXktwEYqcYDvt17my5dTFfnCmr9X6ijXgSvd9Y2WEhrQ2Efq/FdQtIh2/MljvbOAM5B7fdR5DkTOLRvQM4JLKSa6k11T58Azt/sVD+luzZbRFTBEA93zVIyUwxxEpUSSxVx+ic/pkU3eHFqa5WKEXyZghuWYxAjExYwVHBhHihDTtIFy693PybuRsB4X3NH0YT+FxcYdPQNV3ws6+BeGHZlqiKDwVq2VM41nyc73H1QvmqWACg7YOUMcbuTDTb/kfjKEM6pl0I5bGuURwI0MtechO6XeONpkrKElkuaA9fY1qMMuC89rsmyNUjFxQcPZalzgIF/3GwPpVLqpdwWRCtFiDzHMl7/YyZ//atyn9pnTFv+i3/sDrFhwyJaC4GpfEBGBFwqgaHJrOssRQoHgpqXrKynNyWNX4pD9RbfCXXiq0PbkEz9ju+x65Lo1vdAuTjlEBBPfBJR42eq4zzAQERIOXq4YCP7TxMKj7RiZ3Gh13Bwr5TcWY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(39850400004)(376002)(136003)(33430700001)(6506007)(6916009)(6512007)(36916002)(4326008)(86362001)(66476007)(66556008)(6666004)(66946007)(478600001)(16526019)(6486002)(66574014)(33440700001)(33716001)(316002)(9686003)(8936002)(5660300002)(8676002)(2906002)(26005)(186003)(52116002)(956004)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XsZSOD/Ubz2G0Hxozse3EJ8EzPxBSZfsEsiMJqQnN6MZEYG8iPql1AzGw9Vzh9uGdXHxt/dvI7SPJJ3E5uIyhkNVldhDRzO0IkPAU5g51r5UhWNny8/R5CJt+PJxyspxc5U8yKgDbPn9FPus71bmXZg4liFVoYYrUqg3INS66WQxhqokbR2dElCPiuVB4UCvDdU09YoPE0mkmGP04Sg+0b66kIFE+ZYc5J5KRRgNtBewLMzsDYXpb1qSpOfbFLb4DDrE0uVQ7iSr9NvXHsZMa4qkxEqOgogJbmPD98noiAoJn88+C2lJ5Apw9IVG+rsvvK9ZuPJyUFLj7APPOmF76yW/STbHGOs+hrG+Ruh0zsDexSpIz/3m42ERUokQeUky1Zw96gDdO3gClR7ODC72XPoS9gbzPMNhI6/l0yFCUDQi3NyR+cBCG/x10TiyKiIEFVxtKJTJwC4eI1Y4M95eQSSLdCkX0naXPGpIKBNLBiA=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b693e6-92a5-4d00-61de-08d7f65351c4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 09:03:21.3746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcHsNrcRX5YOwt7Nh0SXYReUyd4TQPuKvx4yg98D1bA49C57rCqvD3BU2w+f8pL/vXoPNLotol/dIqn9c/JyUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1726
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tuesday 12 May 2020 10:36:56 CEST Dan Carpenter wrote:
>=20
> We need to release the tx_lock on the error path before returning.
>=20
> Fixes: d1c015b4ef6f ("staging: wfx: rewrite wfx_hw_scan()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Not tested.
>=20
>  drivers/staging/wfx/scan.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/wfx/scan.c b/drivers/staging/wfx/scan.c
> index 76761e4960dd7..eff1be9fb28f8 100644
> --- a/drivers/staging/wfx/scan.c
> +++ b/drivers/staging/wfx/scan.c
> @@ -57,8 +57,10 @@ static int send_scan_req(struct wfx_vif *wvif,
>         wvif->scan_abort =3D false;
>         reinit_completion(&wvif->scan_complete);
>         timeout =3D hif_scan(wvif, req, start_idx, i - start_idx);
> -       if (timeout < 0)
> +       if (timeout < 0) {
> +               wfx_tx_unlock(wvif->wdev);
>                 return timeout;
> +       }
>         ret =3D wait_for_completion_timeout(&wvif->scan_complete, timeout=
);
>         if (req->channels[start_idx]->max_power !=3D wvif->vif->bss_conf.=
txpower)
>                 hif_set_output_power(wvif, wvif->vif->bss_conf.txpower);
> --
> 2.26.2
>=20
>=20

Good catch!

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller


