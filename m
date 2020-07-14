Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C07321EB4D
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jul 2020 10:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgGNI1g (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 04:27:36 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:55386 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgGNI1g (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 04:27:36 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06E8IHPF135305;
        Tue, 14 Jul 2020 08:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Jij8HQLBWWIMQ7FS3TvOUdDmnOmg9/klimDh3lFlaCE=;
 b=bM5DIbfkzA8bjO95NZdrzto+fVxM9OxJTINMAbT5b6R5IrzbnrAHTY6c/Ed75zqoXajy
 UTKoBJUFwN3nh2SD1PJtYZjBzeZ+/FizDm5TybiwEfn8rcAnpZ4Q9B154TgkxGVRXZxx
 Zf7gp+PJFevg3Gb0rtZAMiZEEYag9Aze02IJX/UbSugfhvt5gPQpysicjDLDryGGAZ8Z
 uaANra2nH0BkEfObFd3aY/d0A+SHx1JdGOgz7C9EYvcNbjtKpttpe2qNzNMH6LNCNF7u
 oC4lnDygOZVB5Nw3jhiaITCq9jbn8q8KPhnfYgFcWE9FUFZGRMkAgZY+7uEnBjJvhF3n 9A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 3274ur3y3m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jul 2020 08:27:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06E8IqJC035819;
        Tue, 14 Jul 2020 08:25:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 327qbx5ytn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jul 2020 08:25:30 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06E8PN9c006030;
        Tue, 14 Jul 2020 08:25:23 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jul 2020 01:25:22 -0700
Date:   Tue, 14 Jul 2020 11:25:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Roland Scheidegger <sroland@vmware.com>
Cc:     VMware Graphics <linux-graphics-maintainer@vmware.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/vmwgfx: Fix two list_for_each loop exit tests
Message-ID: <20200714082516.GZ2571@kadam>
References: <20200626103959.GC314359@mwanda>
 <77f0761a-11e6-e321-2245-700258d54924@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77f0761a-11e6-e321-2245-700258d54924@vmware.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140063
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140063
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 14, 2020 at 03:39:13AM +0200, Roland Scheidegger wrote:
> Am 26.06.20 um 12:39 schrieb Dan Carpenter:
> > These if statements are supposed to be true if we ended the
> > list_for_each_entry() loops without hitting a break statement but they
> > don't work.
> > 
> > In the first loop, we increment "i" after the "if (i == unit)" condition
> > so we don't necessarily know that "i" is not equal to unit at the end of
> > the loop.
> So, if I understand this right, this would only really be a problem if
> there's no list entries at all, right? That is i == unit == 0.
> Not sure if that can actually happen, but in any case the fix looks correct.

An empty list and there is another potential issue where unit is exactly
off by one.

	list_for_each_entry(con, &dev_priv->dev->mode_config.connector_list,
			    head) {
		if (i == unit)
			break;
		++i;  <-- this is the last iteration and it's off by one
			  so now i == unit but we didn't exit via the
			  break statement.
	}

	if (i != unit) {
            ^^^^^^^^^
Since we didn't exit by the break statement we want this to be true but
it's false instead.

		DRM_ERROR("Could not find initial display unit.\n");

I don't know how *likely* this is, but static checkers complain.
Technically correct is the best kind of correct!  ;)

regards,
dan carpenter

