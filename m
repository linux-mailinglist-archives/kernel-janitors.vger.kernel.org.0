Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B6556A5E
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 Jun 2019 15:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfFZN0m (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 Jun 2019 09:26:42 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40737 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbfFZN0m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Jun 2019 09:26:42 -0400
Received: by mail-lf1-f65.google.com with SMTP id a9so1572696lff.7
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2019 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0KQNsn2fCmYitiDv9gkNd7pWrAY8HVNXqrIMAFIYMEU=;
        b=NjgJOZQI/OY7TPBgoHm3D6Ry2QJNB0nWXc0QO3Y/AkulA6b6x+4s07J6po52HkDEYI
         9J/z9rxXHc8JWuQbQsoWS1T9uOphoAQrhpC0dfhmfm0UgaGuTeiOaJaD3mPn+hEaAvPi
         1gT+zh2HDcwd2D880J4ulsETR5gWrqkvu5b5ufYiWntVh9jp8BN2fTnpAQZJW5cJBnDR
         zxujoB0IlUBTZgJ1Zg4DctC6+uuN1b4IxwlDSrI1Roeq3t2hdUendNPOgFMnQynDC9Nm
         4rTSCrqxrqWiCQV7Zse2njjzpojDiJ7nxY5eRW+cmjAv/5nnnPheoK1E2NENiZtEt68s
         l7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0KQNsn2fCmYitiDv9gkNd7pWrAY8HVNXqrIMAFIYMEU=;
        b=taJbqYeTfRe5yZV4KXR4iuXxfDCf0sXZZLdpZ5veDpjgTLW2PZdfNyta/9eyNQT2x/
         pb/uRGEdIarDIH+klcnjpu8HP4nwABb043LoTms66CoBK1r6C5Om+rd9G8Xlybn3ziNn
         6zZhdpT6wYTWtobwezp1zkFdqJIiORhL5jYH5V5L5pIoiIyDbqnTk8ie2o94HpCnUPEo
         XdhgCy2OjNUhYqirmeG+kKU2ULQiJYVf5fjZePxHlxOvHZOcfSfFbAjEB2rGV/wvULKI
         tXBFj9DI44gOYR4HH/THbl8yrFx3eEQ9zZSGZVvWZRACJ3LLj6iFZMrzx58qz8mXH+Pa
         0MUQ==
X-Gm-Message-State: APjAAAUXdBLxsJHzCzkDHKiRCUQV/fhJPRfTjiIjb/j/krv1uBbFp2cd
        6XEPJdUPQo1DeNzaMY0hJnbcA6XFZYSytjh2O6kNAg==
X-Google-Smtp-Source: APXvYqybuKo1OFuGMvZFtMATVhgvwQ0TaQVnkAkxGJ6JbLBBP+WfwR/5MF8aidBvBHtvBRNzwMnOhbAikP47ncpNnJ4=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr2678993lfi.140.1561555600322;
 Wed, 26 Jun 2019 06:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190626132427.12615-1-colin.king@canonical.com>
In-Reply-To: <20190626132427.12615-1-colin.king@canonical.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Wed, 26 Jun 2019 14:25:34 +0100
Message-ID: <CAPj87rM9y5Zen5A5KkiCqqUF5m+vAwwtLj-iJrcwFfzMev+Mrw@mail.gmail.com>
Subject: Re: [PATCH][next[ drm/amd/display: fix a couple of spelling mistakes
To:     Colin King <colin.king@canonical.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Nikola Cornij <nikola.cornij@amd.com>,
        Wenjing Liu <Wenjing.Liu@amd.com>,
        amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

On Wed, 26 Jun 2019 at 14:24, Colin King <colin.king@canonical.com> wrote:
> There are a couple of spelling mistakes in dm_error messages and
> a comment. Fix these.

Whilst there, you might fix the '[next[' typo in the commit message.

Cheers,
Daniel
