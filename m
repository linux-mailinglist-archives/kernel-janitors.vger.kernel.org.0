Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C2D21B4D2
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Jul 2020 14:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgGJMPg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 10 Jul 2020 08:15:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:36264 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726725AbgGJMPf (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 10 Jul 2020 08:15:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7AD0DADE2;
        Fri, 10 Jul 2020 12:15:34 +0000 (UTC)
Subject: Re: [PATCH] xen/xenbus: Fix a double free in xenbus_map_ring_pv()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc:     Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Yan Yankovskyi <yyankovskyi@gmail.com>,
        xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
References: <20200710113610.GA92345@mwanda>
From:   =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3434e219-216f-ba50-c001-35a066d20db4@suse.com>
Date:   Fri, 10 Jul 2020 14:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710113610.GA92345@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10.07.20 13:36, Dan Carpenter wrote:
> When there is an error the caller frees "info->node" so the free here
> will result in a double free.  We should just delete first kfree().
> 
> Fixes: 3848e4e0a32a ("xen/xenbus: avoid large structs and arrays on the stack")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for spotting this!

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
