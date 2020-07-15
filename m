Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6042D22023D
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 Jul 2020 04:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgGOCTG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jul 2020 22:19:06 -0400
Received: from ex13-edg-ou-001.vmware.com ([208.91.0.189]:30886 "EHLO
        EX13-EDG-OU-001.vmware.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726456AbgGOCTG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jul 2020 22:19:06 -0400
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 14 Jul 2020 19:19:03 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
        by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 74F9940938;
        Tue, 14 Jul 2020 19:19:04 -0700 (PDT)
Subject: Re: [PATCH] drm/vmwgfx: Fix two list_for_each loop exit tests
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     VMware Graphics <linux-graphics-maintainer@vmware.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>,
        <kernel-janitors@vger.kernel.org>
References: <20200626103959.GC314359@mwanda>
 <77f0761a-11e6-e321-2245-700258d54924@vmware.com>
 <20200714082516.GZ2571@kadam>
From:   Roland Scheidegger <sroland@vmware.com>
Message-ID: <9e2286d0-f941-bad6-d76a-efc60dbab712@vmware.com>
Date:   Wed, 15 Jul 2020 04:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200714082516.GZ2571@kadam>
Content-Type: text/plain; charset="utf-8"
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Received-SPF: None (EX13-EDG-OU-001.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am 14.07.20 um 10:25 schrieb Dan Carpenter:
> On Tue, Jul 14, 2020 at 03:39:13AM +0200, Roland Scheidegger wrote:
>> Am 26.06.20 um 12:39 schrieb Dan Carpenter:
>>> These if statements are supposed to be true if we ended the
>>> list_for_each_entry() loops without hitting a break statement but they
>>> don't work.
>>>
>>> In the first loop, we increment "i" after the "if (i == unit)" condition
>>> so we don't necessarily know that "i" is not equal to unit at the end of
>>> the loop.
>> So, if I understand this right, this would only really be a problem if
>> there's no list entries at all, right? That is i == unit == 0.
>> Not sure if that can actually happen, but in any case the fix looks correct.
> 
> An empty list and there is another potential issue where unit is exactly
> off by one.
> 
> 	list_for_each_entry(con, &dev_priv->dev->mode_config.connector_list,
> 			    head) {
> 		if (i == unit)
> 			break;
> 		++i;  <-- this is the last iteration and it's off by one
> 			  so now i == unit but we didn't exit via the
> 			  break statement.
> 	}
> 
> 	if (i != unit) {
>             ^^^^^^^^^
> Since we didn't exit by the break statement we want this to be true but
> it's false instead.
> 
> 		DRM_ERROR("Could not find initial display unit.\n");
> 
> I don't know how *likely* this is, but static checkers complain.
> Technically correct is the best kind of correct!  ;)
Ahh indeed seems obvious now. But kinda difficult to spot :-).

Thanks again,

Roland


> 
> regards,
> dan carpenter
> 

