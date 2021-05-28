Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984F139464F
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 May 2021 19:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbhE1RVQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 May 2021 13:21:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:37091 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229768AbhE1RVO (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 May 2021 13:21:14 -0400
IronPort-SDR: Vv7eWrKsoqynFyUU0D1dKXpH1FdQxiR3qWo0IMOwY9HtjTi2vk+oyh/KnSyPvdPpPP1X3ZEs7y
 8Me20bQoWjWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9998"; a="190364975"
X-IronPort-AV: E=Sophos;i="5.83,230,1616482800"; 
   d="scan'208";a="190364975"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 10:19:38 -0700
IronPort-SDR: Aly2FSp0W4Y6athkKfvJ4iH53BfAe4jCTnYBUZMSvRAvuP5rAfglJQwS6w/rkqTGeVGfdGB/kM
 Qz0LMvs1zlKQ==
X-IronPort-AV: E=Sophos;i="5.83,230,1616482800"; 
   d="scan'208";a="415359453"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 10:19:36 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lmg8z-00FNUV-QO; Fri, 28 May 2021 20:19:33 +0300
Date:   Fri, 28 May 2021 20:19:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: adjust to removing i2c designware platform
 data
Message-ID: <YLEmJVbVwQaMk+dq@smile.fi.intel.com>
References: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
 <CAHp75Vfv0FQGXrmpDveOf-cBahoDK3uSPHjPU2RNh6mhFxN7vQ@mail.gmail.com>
 <YLD/ZQiX5VhpWJg7@smile.fi.intel.com>
 <YLECsC9y8ici47Ln@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLECsC9y8ici47Ln@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 28, 2021 at 04:48:16PM +0200, Wolfram Sang wrote:
> 
> > > > Remove the file entry to this removed file as well.
> > > 
> > > Oops, I was under the impression I grepped all occurrences, but I have not.
> > > 
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > 
> > > Thanks for the catch!
> > 
> > Wolfram, isn't it forgotten somehow?
> 
> I can pick it. I refrained from doing so because Lukas explicitly asked
> Lee to pick it.

Ah, I see. AFAIR Lee doesn't update his branch frequently, so it might be that
he already applied that but it's not visible to Linux Next.


-- 
With Best Regards,
Andy Shevchenko


