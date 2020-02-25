Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4648616ECA8
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Feb 2020 18:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730720AbgBYRjo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 Feb 2020 12:39:44 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36182 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730704AbgBYRjo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Feb 2020 12:39:44 -0500
Received: by mail-ot1-f67.google.com with SMTP id j20so317692otq.3
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Feb 2020 09:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7OXHupn/eABYBBL7B4Fti1b+jxOPDWyjuii0bnF4epM=;
        b=AE8Q7vZmTYokhYjcCu+0V8M12z+lMXneKH2KNQyQURj0mJ5EYfGOBlZk9Cj3yEKaVR
         mm3V63hec1VXGCQ/iaLeWsOxWOxiNWDPGHTVrHpPBL5t8BR8Ajx3EPC3vmx8LRSTsWIM
         II5YOPb1K3dkHPTSFl0naBblR59myCgaMB4LDU0u2knaidrssXHl9JAVXDiwBbi5V7q/
         AmzAfQlPoZPHMwOf9VjEunUG2SEQi3fTgeIVBJqdOv/8mIfmfU73SSC5CBxH23Lx6Jsj
         pfHR2UE4Nv1pT65soOHOCBjngHOnHUiMYI/dWnItqyW+iIa84DL9QblBgOt8Y8maWC1q
         oMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7OXHupn/eABYBBL7B4Fti1b+jxOPDWyjuii0bnF4epM=;
        b=DKfAwcrUkYBTQmN/57gvpZ/yfrzHUdfhC4OfzO4uvb/sn0Enlko67mRqk7bf0PHMtk
         aKLSoMa/ELt9qW+9ADUUv7/gsI5OyiYK4ytw2oawWSk1AyQovB9ONLlg30Gbh1UQkVoe
         zrYefAbFcseVAhCWb2JwMdyA7RPWGXYwDmV5foc1lT5TuQGKSyKhqbBuEiutHOZxgEqo
         wyRXVho7wCtN7CNkg3zoXMeqcs0YmSRwv2ndm5UM+1bmc4f3hON/kXj0SpiJ9qCHm1a7
         TlMnDje9cQgN8vxRgAIC8roTbxiSVTi8QfhiQwYZZkWqwqHzLpNm0LDgzTglmcFoCp6u
         wPRQ==
X-Gm-Message-State: APjAAAUXR8hyC68r2omueGhqwijjnhPFTbAF1is3h2+9ufy4Renims+q
        12JTOn92k+7zFmgx75d1DV/EYph4chDghsfAuKrB5Q==
X-Google-Smtp-Source: APXvYqwFDa7c/+xdMRI4xMWHsaudTDvmWW/yQIztlU6g8VlP3tvDXsNUwuJCiAlWSGRcL/rIhw1WqGwHAKcfPLxAWTE=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr42746705otl.71.1582652383462;
 Tue, 25 Feb 2020 09:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20200225161927.hvftuq7kjn547fyj@kili.mountain>
In-Reply-To: <20200225161927.hvftuq7kjn547fyj@kili.mountain>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 25 Feb 2020 09:39:32 -0800
Message-ID: <CAPcyv4ht6kicLV_uk5Rt7a7iAxXrwuVoN2m6uVSw0h3qiE4AhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] acpi/nfit: improve bounds checking for 'func'
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 25, 2020 at 8:20 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The 'func' variable can come from the user in the __nd_ioctl().  If it's
> too high then the (1 << func) shift in acpi_nfit_clear_to_send() is
> undefined.  In acpi_nfit_ctl() we pass 'func' to test_bit(func, &dsm_mask)
> which could result in an out of bounds access.
>
> To fix these issues, I introduced the NVDIMM_CMD_MAX (31) define and
> updated nfit_dsm_revid() to use that define as well instead of magic
> numbers.
>
> Fixes: 11189c1089da ("acpi/nfit: Fix command-supported detection")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

I'll apply this to my fixes branch.
