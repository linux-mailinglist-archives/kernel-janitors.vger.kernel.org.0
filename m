Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A51BE5C5
	for <lists+kernel-janitors@lfdr.de>; Wed, 25 Sep 2019 21:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392375AbfIYTgr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 25 Sep 2019 15:36:47 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35817 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392365AbfIYTgq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Sep 2019 15:36:46 -0400
Received: by mail-oi1-f196.google.com with SMTP id x3so5996911oig.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Sep 2019 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CcEEswff8ixtyD6OftQjIAyxZUeUVmm/91cx8aX+KYY=;
        b=1bR5diiQFy6YflrAccl4qjRlmKxWN8BoVRq4mSqG8Sh8lJmYkgUFUS8jCazmjnq90M
         jz/Ape7fHeUMM4/+dIM2rECjfk4Q+S+CF9Q/U6TpcpqMPLVgUo8I7awaMljtxEh1U8VJ
         yvUx+h94HkOhxflhBRXAnEagYNYj1jJdclEHu7lA6h81ZHzwOenJKoDQDJ+aMyvnCCm3
         78tR4Kv5bevsj742qx0/BoHNoPN9ybjP/OxoaBEExrWQp+ICPpINwRXwhfl6oVzm41Dv
         Q+dggow0pKxoE2pHQCmcbxj98MnywwuBr7FKb8kHBQe2ToDYzuME0iK5g2jM+H+tzgZ4
         UqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CcEEswff8ixtyD6OftQjIAyxZUeUVmm/91cx8aX+KYY=;
        b=sQlDVPCydlReGj81FsPgqLhVtXkHjDg2AS4Wc7Mv/IUV7vYk/iq+5x0LIVuh3uEUHk
         6jI55xdxs5OOnPhiF8C/ce9PJ7kw/OYKAGFGgpjafQxozhT37Phz3xcg9IvcLmQUhe/6
         2vll3UEt/hcJ44UXu7Ja2UEUF9hR5dGlhC9ISv3OGWl5MhoAsk22EfaFrOAhi29qzKZF
         uI1mE0KD32LiMow614mdhDuW3fDIXrK7QFQyU+91Mx6JafMxlIuThP8U2LeTb8ePT+ju
         xq41THBO71x5JoYEgKOeoZRLq6Y0pmUH6Z0LezmGMx2OYAJGTTpHijUp659LlUF+YT2b
         C/zg==
X-Gm-Message-State: APjAAAWOX+Xika8BtPqGs+fFBxeAoLe1h95fIwz45jhlflOd9hwzLTrd
        LIXnljhY+NZp+GzsWYVfOaveeNptCoHzbfTH9iQ6NTfJ1GE=
X-Google-Smtp-Source: APXvYqw6DYedroBV6yr1qAVhpWfJZbbiaeRctb/ep0Ghj1D2jNemKqK1JSEvmErUxr7RKxUepRLpJYK3C8TEqOOaNkU=
X-Received: by 2002:aca:5dc3:: with SMTP id r186mr5521337oib.73.1569440205801;
 Wed, 25 Sep 2019 12:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190925184852.11707-1-ira.weiny@intel.com>
In-Reply-To: <20190925184852.11707-1-ira.weiny@intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 25 Sep 2019 12:36:35 -0700
Message-ID: <CAPcyv4jtYxggf-+ZvO5PN3KTMjiqqJrpj_V39_9axJZNpG_EQg@mail.gmail.com>
Subject: Re: [PATCH V2] bnvdimm/namsepace: Don't set claim_class on error
To:     "Weiny, Ira" <ira.weiny@intel.com>
Cc:     Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 25, 2019 at 11:49 AM <ira.weiny@intel.com> wrote:
>
> From: Ira Weiny <ira.weiny@intel.com>
>
> Don't leave claim_class set to an invalid value if an error occurs in
> btt_claim_class().
>
> While we are here change the return type of __holder_class_store() to be
> clear about the values it is returning.
>
> This was found via code inspection.
>
> Reviewed-by: Vishal Verma <vishal.l.verma@intel.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>
> ---
> V1->V2
>         Add space after variable declaration...

Oh, was also hoping this would address s/bnvdimm/libnvdimm/ in the
patch subject.

Note, kernel-janitors is for minor spelling fixes and trivial changes
with no runtime side-effects that might otherwise fall through the
cracks. This has functional implications so is not a janitorial
change.

One more comment below...

>
>  drivers/nvdimm/namespace_devs.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> index 5b22cecefc99..eef885c59f47 100644
> --- a/drivers/nvdimm/namespace_devs.c
> +++ b/drivers/nvdimm/namespace_devs.c
> @@ -1510,16 +1510,20 @@ static ssize_t holder_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(holder);
>
> -static ssize_t __holder_class_store(struct device *dev, const char *buf)
> +static int __holder_class_store(struct device *dev, const char *buf)
>  {
>         struct nd_namespace_common *ndns = to_ndns(dev);
>
>         if (dev->driver || ndns->claim)
>                 return -EBUSY;
>
> -       if (sysfs_streq(buf, "btt"))
> -               ndns->claim_class = btt_claim_class(dev);
> -       else if (sysfs_streq(buf, "pfn"))
> +       if (sysfs_streq(buf, "btt")) {
> +               int rc = btt_claim_class(dev);
> +
> +               if (rc < NVDIMM_CCLASS_NONE)
> +                       return rc;
> +               ndns->claim_class = rc;
> +       } else if (sysfs_streq(buf, "pfn"))
>                 ndns->claim_class = NVDIMM_CCLASS_PFN;
>         else if (sysfs_streq(buf, "dax"))
>                 ndns->claim_class = NVDIMM_CCLASS_DAX;
> @@ -1528,10 +1532,6 @@ static ssize_t __holder_class_store(struct device *dev, const char *buf)
>         else
>                 return -EINVAL;
>
> -       /* btt_claim_class() could've returned an error */
> -       if ((int)ndns->claim_class < 0)
> -               return ndns->claim_class;
> -

Since this effectively replaces Dan's patch can you respin without
that baseline, and just give Dan credit with a Reported-by?

>         return 0;
>  }
>
> @@ -1539,7 +1539,7 @@ static ssize_t holder_class_store(struct device *dev,
>                 struct device_attribute *attr, const char *buf, size_t len)
>  {
>         struct nd_region *nd_region = to_nd_region(dev->parent);
> -       ssize_t rc;
> +       int rc;
>
>         nd_device_lock(dev);
>         nvdimm_bus_lock(dev);
> @@ -1547,7 +1547,7 @@ static ssize_t holder_class_store(struct device *dev,
>         rc = __holder_class_store(dev, buf);
>         if (rc >= 0)
>                 rc = nd_namespace_label_update(nd_region, dev);
> -       dev_dbg(dev, "%s(%zd)\n", rc < 0 ? "fail " : "", rc);
> +       dev_dbg(dev, "%s(%d)\n", rc < 0 ? "fail " : "", rc);
>         nvdimm_bus_unlock(dev);
>         nd_device_unlock(dev);
>
> --
> 2.20.1
>
