Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A332916ECC6
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Feb 2020 18:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731294AbgBYRka (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 Feb 2020 12:40:30 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34608 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731254AbgBYRk3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Feb 2020 12:40:29 -0500
Received: by mail-ot1-f66.google.com with SMTP id j16so337482otl.1
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Feb 2020 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iYtNZ1xT6uFxT8TBLjArkPtxeHvwasJTNpB6uOAhuuM=;
        b=vLp0hdjATiQFiYDWcV8uCuBKu/MDvQb4xSQ1J2o3Vxgi7RVy4e9ZsEWQQ575qDQTRW
         9Ew2R9vixKS3jn2cv6NlgWjfNAW6YIUurfP3C1fbwdwSoXA1YM/2EqIpb0ey5EVAye/2
         g7YFbsboxePJx3dlbwa2HI/49qSkNpDa3LJOffu0GP+ve/NRc8lQB3owKvwOeviY2mj4
         8eEE3QNGJ5yB88CHoSMU34so4iDVao/D5iWnq7tGoTPXsH1XupjeGJmpGiRQZtCG9hVm
         NR3A1af0MhepiT/G397PMavZQD/g6sbtFzQouSzq8W+0QnYrE5g1H1jpC0v0pok7NBHK
         rRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iYtNZ1xT6uFxT8TBLjArkPtxeHvwasJTNpB6uOAhuuM=;
        b=Zg6ilT5/y13ItNc0DAo7XKETy77b84GkFV/zOOEjmxAVURj2df9h1lZQ2Ux+M65A8P
         9b+gy71UjyVmAXDcAXNWFwOy/ebnvjThQ5qY/pMPuYK4DVZSC/grvemUUR4c/vL8bgXW
         ixdbV+tLO/OUWFf+Qze1Ch/EbWBQAbWKtxsIh3OrOuq7U+6WbPTC+m5X60M05X2+lyN3
         noAZZgSsX20BoXyVEDo2OfmNPyldeecCESD1r/32t7/DuTuRm9hfgtb3jjazoC0ZyquJ
         Ll/ymmjgkfyMch7uZudRjeYVhrvVS/wJWSEX7rZ6vnnRAJkOcSmVv4SVw0wFTm17Amwt
         s+vg==
X-Gm-Message-State: APjAAAXonPs8Cpj7Ob8PfU4hvTbqyX8FQYVY64+/9/XeP/4X5GvloVN9
        tOsJ9WlQyo0Ey4soYcSstlkFxlzCiD7zA9LSPGGqHg==
X-Google-Smtp-Source: APXvYqwGTSmHP8luhoLnsu9zg2hn84azyAtuqIl0pEBs9Aisv3xWMqq2Kqhgt07QP/Tmo0fTgzoRihjhPo9DWyzmYmA=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr42748771otl.71.1582652428399;
 Tue, 25 Feb 2020 09:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20200225161927.hvftuq7kjn547fyj@kili.mountain> <20200225162055.amtosfy7m35aivxg@kili.mountain>
In-Reply-To: <20200225162055.amtosfy7m35aivxg@kili.mountain>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 25 Feb 2020 09:40:17 -0800
Message-ID: <CAPcyv4h99vYcxgJ_9NKtYbhAGsifTG0JCRYq-j2t_CQinHZVcw@mail.gmail.com>
Subject: Re: [PATCH 2/2] libnvdimm: Out of bounds read in __nd_ioctl()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 25, 2020 at 8:21 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "cmd" comes from the user and it can be up to 255.  It it's more
> than the number of bits in long, it results out of bounds read when we
> check test_bit(cmd, &cmd_mask).  The highest valid value for "cmd" is
> ND_CMD_CALL (10) so I added a compare against that.
>
> Fixes: 62232e45f4a2 ("libnvdimm: control (ioctl) messages for nvdimm_bus and nvdimm devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good, applied.
