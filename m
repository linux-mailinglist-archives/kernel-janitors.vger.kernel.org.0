Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A37221F422
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 16:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgGNObx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 10:31:53 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42450 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgGNObx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 10:31:53 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EEMr8K063274;
        Tue, 14 Jul 2020 14:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=dzppCwyHQJu68aR8rQTbAZ/zoacNW4e768vQA71xWeU=;
 b=FGNmPC7OiQI6a/6RmlMONV93ZnaMrTFe+BHCUsOsNiUj7NxJoco6BG1ZRqvhVXDiDjbj
 tCkVUnNte4MRHqRSCJYO/AGw/1J2SJl0a00321dGMRU4JA0qOZKQZolmtMSk12P0k4VI
 QxLkiGMLnvvt5XuozFdAHDi8elPC4hT7U7efoHgQod5oVuHF39x5zQHTScfNzunhGrvC
 ntDLRMwaxEAEqGetwU/ZBrA+fqRD/tkv4tnSA4z+OQ6CYCYGY54rgZtfehjrkrcF21Hp
 wqZ3v+bj3cZv5bkvB2fdI4pqN6Ch8AzXcSEudECBPSzaLgbBeXdXfoVCYtwiDdQO7XzI fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 32762ndjn0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jul 2020 14:31:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EERZVv114120;
        Tue, 14 Jul 2020 14:31:42 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 327qb48dje-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jul 2020 14:31:42 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06EEVdcr026211;
        Tue, 14 Jul 2020 14:31:39 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jul 2020 07:31:38 -0700
Date:   Tue, 14 Jul 2020 17:31:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-ID: <20200714143129.GX2549@kadam>
References: <20200714141216.GA314989@mwanda>
 <71508ba9-6cad-45f9-a3b1-b3401ac0a1d5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71508ba9-6cad-45f9-a3b1-b3401ac0a1d5@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140111
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 14, 2020 at 05:16:33PM +0300, Lionel Landwerlin wrote:
> On 14/07/2020 17:12, Dan Carpenter wrote:
> > The error code is not set on this error path.  It's either zero or
> > uninitialized at this point.
> > 
> > Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > index deb6dec1b5ab..7aa73bb03381 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > @@ -329,6 +329,7 @@ static int live_noa_gpr(void *arg)
> >   	cs = intel_ring_begin(rq, 2 * 32 + 2);
> >   	if (IS_ERR(cs)) {
> >   		i915_request_add(rq);
> > +		err = PTR_ERR(cs);
> >   		goto out_rq;
> >   	}
> 
> Looks like there is another below :
> 
> cs = intel_ring_begin(rq, 4);
> if (IS_ERR(cs)) {
>         i915_request_add(rq);
>         goto out_rq;
> }

Oh...  Hm...  I'm looking at linux-next now and you're right.  Also
Colin already fixed the return that I fixed.  I'll resend.

regards,
dan carpenter

