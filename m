Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B507564280
	for <lists+kernel-janitors@lfdr.de>; Sat,  2 Jul 2022 21:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiGBTcg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 2 Jul 2022 15:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiGBTcg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 2 Jul 2022 15:32:36 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88F765A9;
        Sat,  2 Jul 2022 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656790354; x=1688326354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=leQjJttDswW7L5jBlF9YSCONqNBEeZO/ysMhzGdcPrM=;
  b=bLs2IvlRE0kDu/mkleVusiww8GHNbnclBxM80OV26qeTigiCliTLYJR7
   GPV2+ykwkrqp+NFYtyXmJycNK+TuXwlsAtuQ46E08Inf9+m7PVp6+Lzsk
   WjO5N+pYmFQt4WBkArYCoeG1geBoBN4XUiHKDuQpUS1LYTsmIEqXzOzrA
   KW78SljzRR3BzK4ZFJ9+ocH1qukZ9VtQmK7kwrU93kKyQQ8UJ/Azn76a4
   SSBuzBaubJpzvCgyuqkwc0rr/Y8J27eyUKZ6eF8DBC91YnBZrgbByXY/T
   F8AFjSlR++Kqa3TNZQZTXR3l48vIEzgAqkBcXj8hIbACt3QUKRXFlGBDZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="308394859"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="308394859"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 12:32:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="624624692"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 12:32:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o7iqw-0013qw-2i;
        Sat, 02 Jul 2022 22:32:26 +0300
Date:   Sat, 2 Jul 2022 22:32:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com,
        vneethv@linux.ibm.com, oberpar@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        almaz.alexandrovich@paragon-software.com, yury.norov@gmail.com,
        linux@rasmusvillemoes.dk, linux-s390@vger.kernel.org,
        ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/4] s390/cio: Rename bitmap_size() as idset_bitmap_size()
Message-ID: <YsCdSkzSbVz9gnci@smile.fi.intel.com>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <3f2ad7fb91948525f6c52e0d36ec223cd3049c88.1656785856.git.christophe.jaillet@wanadoo.fr>
 <YsCUW6vT7LlAv2UE@smile.fi.intel.com>
 <6063ee97-1bbe-2391-78cb-57572851a52c@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6063ee97-1bbe-2391-78cb-57572851a52c@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jul 02, 2022 at 09:24:24PM +0200, Christophe JAILLET wrote:
> Le 02/07/2022 � 20:54, Andy Shevchenko a �crit�:
> > On Sat, Jul 02, 2022 at 08:29:09PM +0200, Christophe JAILLET wrote:

...

> > > -		memset(set->bitmap, 0, bitmap_size(num_ssid, num_id));
> > > +		memset(set->bitmap, 0, idset_bitmap_size(num_ssid, num_id));
> > 
> > Why not to use bitmap_zero()?

...

> > > -	memset(set->bitmap, 0xff, bitmap_size(set->num_ssid, set->num_id));
> > > +	memset(set->bitmap, 0xff, idset_bitmap_size(set->num_ssid, set->num_id));
> > 
> > Why not to use bitmap_fill() ?

> For this initial step, I wanted to keep changes as minimal as possible (i.e
> just function renaming)
> 
> In fact, I plan to send a follow-up patch on this file.
> This would remove the newly renamed idset_bitmap_size() function, use the
> bitmap API directly (as you pointed-out) with
> "set->num_ssid * set->num_id" as size.
> 
> It is already done this way in idset_is_empty(), so it would be more
> consistent.
> 
> If the serie needs a v2 (or if required), I can add an additional 5th patch
> for it. Otherwise it will send separatly later.

If you use bitmap APIs as I suggested above as the first patch, the rest will
have less unneeded churn, no?


-- 
With Best Regards,
Andy Shevchenko


