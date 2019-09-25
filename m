Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E7EBE4FF
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 20:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfIYStl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 14:49:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:8384 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbfIYStk (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 14:49:40 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 11:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,549,1559545200"; 
   d="scan'208";a="389321014"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
  by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2019 11:49:39 -0700
Date:   Wed, 25 Sep 2019 11:49:39 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc:     "Williams, Dan J" <dan.j.williams@intel.com>,
        "Jiang, Dave" <dave.jiang@intel.com>,
        "Busch, Keith" <keith.busch@intel.com>,
        "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] bnvdimm/namsepace: Don't set claim_class on error
Message-ID: <20190925184939.GA11669@iweiny-DESK2.sc.intel.com>
References: <20190925181056.11097-1-ira.weiny@intel.com>
 <ff7ff4f5b4289d189a7c347591a5c35876ea804f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff7ff4f5b4289d189a7c347591a5c35876ea804f.camel@intel.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  drivers/nvdimm/namespace_devs.c | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> One minor nit below, but otherwise it looks good to me:
> Reviewed-by: Vishal Verma <vishal.l.verma@intel.com>

Thanks...

> 
> > 
> > diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> > index 5b22cecefc99..a020c166e1e7 100644
> > --- a/drivers/nvdimm/namespace_devs.c
> > +++ b/drivers/nvdimm/namespace_devs.c
> > @@ -1510,16 +1510,19 @@ static ssize_t holder_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(holder);
> >  
> > -static ssize_t __holder_class_store(struct device *dev, const char *buf)
> > +static int __holder_class_store(struct device *dev, const char *buf)
> >  {
> >  	struct nd_namespace_common *ndns = to_ndns(dev);
> >  
> >  	if (dev->driver || ndns->claim)
> >  		return -EBUSY;
> >  
> > -	if (sysfs_streq(buf, "btt"))
> > -		ndns->claim_class = btt_claim_class(dev);
> > -	else if (sysfs_streq(buf, "pfn"))
> > +	if (sysfs_streq(buf, "btt")) {
> > +		int rc = btt_claim_class(dev);
> 
> Need a blank line here separating variable declarations and code.

<sigh> yea I know better...  ;-)

V2 sent...

Thanks,
Ira

