Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE2CBE6F7
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 23:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfIYVSR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 17:18:17 -0400
Received: from mga11.intel.com ([192.55.52.93]:27385 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438206AbfIYVQW (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 17:16:22 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 14:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,549,1559545200"; 
   d="scan'208";a="193907300"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
  by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 14:15:20 -0700
Date:   Wed, 25 Sep 2019 14:15:20 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH V2] bnvdimm/namsepace: Don't set claim_class on error
Message-ID: <20190925211520.GA12748@iweiny-DESK2.sc.intel.com>
References: <20190925184852.11707-1-ira.weiny@intel.com>
 <CAPcyv4jtYxggf-+ZvO5PN3KTMjiqqJrpj_V39_9axJZNpG_EQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4jtYxggf-+ZvO5PN3KTMjiqqJrpj_V39_9axJZNpG_EQg@mail.gmail.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 25, 2019 at 12:36:35PM -0700, Dan Williams wrote:
> On Wed, Sep 25, 2019 at 11:49 AM <ira.weiny@intel.com> wrote:
> >

[snip]

> >
> > ---
> > V1->V2
> >         Add space after variable declaration...
> 
> Oh, was also hoping this would address s/bnvdimm/libnvdimm/ in the
> patch subject.

Yea...

> 
> Note, kernel-janitors is for minor spelling fixes and trivial changes
> with no runtime side-effects that might otherwise fall through the
> cracks. This has functional implications so is not a janitorial
> change.

Ah yea I just thought it was ok to let that list know what was going on...
I've removed them from V3.  Sorry.

> 
> One more comment below...
> 

[snip]

> > -
> 
> Since this effectively replaces Dan's patch can you respin without
> that baseline, and just give Dan credit with a Reported-by?

V3 sent.

Ira

