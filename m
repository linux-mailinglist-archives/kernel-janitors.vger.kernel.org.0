Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5C521F8C3
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 20:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgGNSJM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 14:09:12 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:48348 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgGNSJL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 14:09:11 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EHqtsl120623;
        Tue, 14 Jul 2020 18:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6XLGxEVw0DDjgjZ/UWKg1OFyQH8dhElNgxCZ2L/4g9Y=;
 b=mkCuPF2xYT2SplQW9E7YRW5Xgs1Eda8mjHoFnxAPwa62BiB1U4i0BjNKk4WNXJ+uBJ0O
 D1ZaksXmd0J4lRo5W8/m0aPGmYhCk5QEXrGQ5LcvMDCyYBEtnntki8cIsVsCVVbhkb1B
 i3bztomsi1VGZWfrOlau9Z8As7BJVKzRjKUwbqvDz/9ilx0Q/tla7ce2M17bUGuKFnZq
 90oUQpc89deEVI7jdEWwDpj9N/H+gPgc51ruQ9xgi5eSJL8Ww8X0SPwQ4znaxxxd5AMK
 VfkeJxDP05c+AO2VgzlyGvS/pZ0dq5O6fPj9sElK5qBt5ReVPfwCVTVUjFGTefSlGPIR uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 3275cm6yv5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jul 2020 18:09:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EHrbFF087106;
        Tue, 14 Jul 2020 18:09:01 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 327q0pq0yc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jul 2020 18:09:01 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06EI90iL017614;
        Tue, 14 Jul 2020 18:09:00 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jul 2020 11:08:58 -0700
Date:   Tue, 14 Jul 2020 21:08:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/selftest: Fix an error code in
 live_noa_gpr()
Message-ID: <20200714180852.GC2571@kadam>
References: <20200714143652.GA337376@mwanda>
 <29d5e25e-45e1-fca0-7d09-fd5e303b9eea@intel.com>
 <159474692212.3188.5286642208247298191@build.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159474692212.3188.5286642208247298191@build.alporthouse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9682 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9682 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140130
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 14, 2020 at 06:15:22PM +0100, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-07-14 15:39:21)
> > On 14/07/2020 17:36, Dan Carpenter wrote:
> > > The error code needs to be set on this path.  It currently returns
> > > success.
> > >
> > > Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
> > > Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > v2: Fix a different bug instead.  :P  Colin fixed mine already.
> 
> I was thinking that Colin already sent the patch for this one...

Colin sent a fix for my v1 bug.  commit d2921096e707 ("drm/i915/selftest:
fix an error return path where err is not being set") but I don't think
he fixed this one.

regards,
dan carpenter

