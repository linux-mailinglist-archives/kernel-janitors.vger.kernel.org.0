Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAF83F1DC3
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Nov 2019 19:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfKFSti (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 Nov 2019 13:49:38 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:41172 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbfKFSti (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Nov 2019 13:49:38 -0500
Received: by mail-pf1-f201.google.com with SMTP id j2so19674978pfa.8
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Nov 2019 10:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=iuhKlytJBZM6z4JfLv4nGpswwtwyGQLqGn2PJIaoWCM=;
        b=hBcR4sd/6XYZVq594jdQ+i79/9ZXlBpq2iJFRWLOmD3spNkjRNe+mVflTyHP8Q9dE+
         u3MGAM0kFdZVliTFaJ6Qk9/890kOPzZbf2e/gSGu/ItaVXE1P1pokh38IrmGSc4mGHwK
         hh91R71Am9AIlz9pdsTW5DBI3EBeUPP2sdwOUIXZiWEcOwWd16+5p8KPTuoaCPmiyaS8
         MMTLvoKIqB19NjchLW6yehriOwyfxo0Dw61hP/zAK254hzGmC3yxOpx2QxmKpfYGIehp
         Y3fkduB2rrSbrS0JadmAg1FM16FV5yzhUozU8h0fgl19HVmEXr8Exms7TV/i5xKXmiJh
         ZXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iuhKlytJBZM6z4JfLv4nGpswwtwyGQLqGn2PJIaoWCM=;
        b=RXctQqSjK4PAal1ry+0HGdedtiDnsRAmXlkotbEgN67DYfZrzoU7h+0VsJsrIxSv/8
         uvYgmOtE4mbjw5/b5rlh4+yNNG3pvtyjikdqZMED9+w8s1+3RvDBCszO3rZHGuQNNXSG
         jUq0hr/FMSoVVBqL/l0jcPlyqS+MXD45aXIglVMwxOEe35vRSHY6ygA9CPCLaVO72toz
         K7aRTOeIi9L0qph/xfD/aK06KLihzmKVt4Yvt55qxmhAze5/2plFUEO5qGrJLPATdBYn
         TswVdTWG/0FVvGsnrgfTMWgHtNTjE++vpfxJHMo7W3cNmJ1PqNSVksusbHIFQ3myHYFD
         4+gQ==
X-Gm-Message-State: APjAAAWAKldwb2VT4kyUsnfo+PG9YuTm2EIEd2VZfG/KAAe4w/8P1If9
        6gtY3Vi4jarj7tOWZGJ2+wUno9Qvnw==
X-Google-Smtp-Source: APXvYqxwRyZ8JO9BSn9Wbg9rolgzDQlfODKPEiZ6igpaIr0m8nKCMYQGHG735BO75tms3/j1xkDgEPQZ94I=
X-Received: by 2002:a63:1001:: with SMTP id f1mr4574203pgl.373.1573066175512;
 Wed, 06 Nov 2019 10:49:35 -0800 (PST)
Date:   Wed,  6 Nov 2019 10:49:31 -0800
In-Reply-To: <20191106115651.113943-1-weiyongjun1@huawei.com>
Message-Id: <20191106184931.200312-1-yabinc@google.com>
Mime-Version: 1.0
References: <20191106115651.113943-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
Subject: Re: [PATCH -next] coresight: replicator: Fix missing spin_lock_init()
From:   Yabin Cui <yabinc@google.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks for the fix! I should have tested with CONFIG_DEBUG_SPINLOCK.

Tested-by: Yabin Cui <yabinc@google.com>
