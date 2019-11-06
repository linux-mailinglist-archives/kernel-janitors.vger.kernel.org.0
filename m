Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26695F1DBE
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Nov 2019 19:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfKFSro (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 Nov 2019 13:47:44 -0500
Received: from mail-yb1-f202.google.com ([209.85.219.202]:35269 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbfKFSro (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Nov 2019 13:47:44 -0500
Received: by mail-yb1-f202.google.com with SMTP id y64so19525829ybf.2
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Nov 2019 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=iuhKlytJBZM6z4JfLv4nGpswwtwyGQLqGn2PJIaoWCM=;
        b=an/QfeoCwD2+tFI6iqjZzV7+UGnY37JqBMJqrr0vygODNoAZFN8hY3gGzThuYrNro4
         r1vixHZyW4gKDC0lQB1etIs2JcMDTaRIRi6Ha49VBCRzsmZu09UBiBH789KlJV+UVq4E
         5Q9tTdnJOJz16j3gl3npT6ro1ko/QmhobuY3fPeffAH4xEMrYEWo8ruhSqpMriM66EPs
         lDGDloiBd546bql5UixXyvn8rMEhqh1LvR6qvJmiJPq8mm6qRQhd+cyYK1wAjbIjc9eN
         LTru6pLONi219DtbPwP4dlBfQsfg4II//sMTFQG/EiPH9Zi9wYi48hsiLY3Ui5fPAfvO
         p4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iuhKlytJBZM6z4JfLv4nGpswwtwyGQLqGn2PJIaoWCM=;
        b=LpPGs/dZK+W27X5SasWLxBcGRadYH5UChTwQ0V1CideCff0ljun783Kx6ClWvuBkGi
         CAr4d/3zp72BF/eLeyiV+F0ydD+g4/n1PHKtlvO8GWatpx31rUTjNXOLTf6qUBwDIhfC
         QdhU9NHviem59MmAkSE1otPzKPG+UYX37xvKGtRo3fCSID4hGk0etF3BNyJiskVZpw51
         xzLO3SjgB9ScXdfwFjvoJomQ1en18rphALnOMQP2SpcEgtTXXrDaOXDd/sHujnRQTMVJ
         +eQ95xvt6TOdYSCuc59uNwuF4QiHXRiGaRj3JHpinoP1etEAczCcQCG9AEUe9yGYepS+
         TMBQ==
X-Gm-Message-State: APjAAAVA1QcLmEi/ZhT2fuci4jmmp9l8u77eowLlt7kKbQibDdmYy/+P
        g24DhYE9gK1CXP//RmizITyOlxV3hw==
X-Google-Smtp-Source: APXvYqyBRZvedRyg+ZlKZ/6ICI2pXNHbDWSG6ZQeXweM7qES38VeJjyjQdoRw+EcD4m63xepknj4SpOjNJ0=
X-Received: by 2002:a25:cf55:: with SMTP id f82mr3560949ybg.203.1573066063184;
 Wed, 06 Nov 2019 10:47:43 -0800 (PST)
Date:   Wed,  6 Nov 2019 10:47:36 -0800
In-Reply-To: <20191106120021.115200-1-weiyongjun1@huawei.com>
Message-Id: <20191106184736.197733-1-yabinc@google.com>
Mime-Version: 1.0
References: <20191106120021.115200-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
Subject: Re: [PATCH -next] coresight: funnel: Fix missing spin_lock_init()
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
